import 'package:flutter/material.dart';
import 'package:travel_blog/detail.dart';
import 'package:travel_blog/model/travel.dart';

class MostPopular extends StatelessWidget {
  MostPopular({Key? key}) : super(key: key);
  final _list = Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          var travel = _list[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DetailPage(travel: travel,);
              }));
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    travel.url,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    left: 15,
                    bottom: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            travel.location,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            travel.location,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          );
        }),
        separatorBuilder: (_, index) => SizedBox(
              width: 15,
            ),
        itemCount: _list.length);
  }
}
