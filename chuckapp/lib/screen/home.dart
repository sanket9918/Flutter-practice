import 'package:chuckapp/dio/client.dart';
import 'package:chuckapp/model/joke.dart';
import 'package:chuckapp/widget/categories.dart';
import 'package:chuckapp/widget/custom_app_bar.dart';
import 'package:chuckapp/widget/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var loading = false;
  late DioClient dioClient;
  late Future<Joke> joke;

  @override
  void initState() {
    super.initState();
    dioClient = DioClient();
    // loading = true;
    // joke = dioClient.fetchJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [Header(), Categories()],
          ),
        ),
      ),
    );
  }
}
