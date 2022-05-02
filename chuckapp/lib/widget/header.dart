import 'package:chuckapp/dio/client.dart';
import 'package:chuckapp/model/joke.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var loading = false;
  late DioClient dioClient;
  late Future<Joke> joke;

  @override
  void initState() {
    super.initState();
    dioClient = DioClient();
    loading = true;
    joke = dioClient.fetchJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          // margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // height: 150,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).colorScheme.primary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Random Joke",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16, color: Colors.white54)),
                  IconButton(
                    onPressed: () {
                      joke = dioClient.fetchJoke();
                      setState(() {
                        loading = true;
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    color: Colors.white,
                  )
                ],
              ),
              if (loading)
                FutureBuilder<Joke>(
                  future: joke,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data!.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text("No chuck for now :(");
                    }
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ));
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
