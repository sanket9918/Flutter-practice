import 'package:chuckapp/dio/client.dart';
import 'package:chuckapp/model/joke.dart';
import 'package:chuckapp/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SpecificCategoryJoke extends StatefulWidget {
  final String category;
  const SpecificCategoryJoke({Key? key, required this.category})
      : super(key: key);

  @override
  State<SpecificCategoryJoke> createState() => _SpecificCategoryJokeState();
}

class _SpecificCategoryJokeState extends State<SpecificCategoryJoke> {
  var loading = false;
  late DioClient dioClient;
  late Future<Joke> joke;
  @override
  void initState() {
    super.initState();
    dioClient = DioClient();
    loading = true;
    joke = dioClient.fetchCategoryJoke(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder<Joke>(
        future: joke,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Theme.of(context).colorScheme.background,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Category",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                            ),
                            Text(
                              widget.category,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                          letterSpacing: 2),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              joke =
                                  dioClient.fetchCategoryJoke(widget.category);
                              setState(() {
                                loading = true;
                              });
                            },
                            icon: Icon(
                              Icons.refresh,
                              color: Theme.of(context).colorScheme.primary,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),                              
                              border: Border.all(width: 1)),
                      child: Text(
                        snapshot.data!.value,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Container(
                          width: 60,
                          height: 60,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1)),
                          child: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ))
                  ],
                ),
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
    );
  }
}
