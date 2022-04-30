import 'package:flutter/material.dart';
import 'package:house_rent/model/house.dart';
import 'package:house_rent/screens/details/widget/about.dart';
import 'package:house_rent/screens/details/widget/content_intro.dart';
import 'package:house_rent/screens/details/widget/house_info.dart';
import 'package:house_rent/widgets/detail_app_bar.dart';

class DetailPage extends StatelessWidget {
  final House house;
  const DetailPage({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailAppBar(
            house: house,
          ),
          SizedBox(
            height: 20,
          ),
          ContentIntro(
            house: house,
          ),
          SizedBox(
            height: 20,
          ),
          HouseInfo(),
          SizedBox(
            height: 20,
          ),
          About()
        ],
      )),
    );
  }
}
