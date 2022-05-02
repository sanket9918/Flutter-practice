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
      appBar: CustomAppBar(),
      body: FutureBuilder<Joke>(
        future: joke,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              color: Theme.of(context).colorScheme.background,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Category : ${widget.category}",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      snapshot.data!.value,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("No chuck for now :(");
          }
          return Center(
              child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ));
        },
      ),
    );
  }
}
