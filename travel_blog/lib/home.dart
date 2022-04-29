import 'package:flutter/material.dart';
import 'package:travel_blog/widgets/most_popular.dart';
import 'package:travel_blog/widgets/travel_blog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            "Travel Blog",
            style: TextStyle(color: Colors.black, fontSize: 36),
          ),
        ),
        Expanded(flex: 2, child: TravelBlog()),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Most Popular",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "View More",
                style: TextStyle(fontSize: 16, color: Colors.orange),
              )
            ],
          ),
        ),
        Expanded(flex: 1, child: MostPopular()),
      ]),
    );
  }
}
