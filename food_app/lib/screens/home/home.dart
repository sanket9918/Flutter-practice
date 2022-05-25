import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/screens/home/widget/custom_app_bar.dart';
import 'package:food_app/widgets/food_list.dart';
import 'package:food_app/widgets/food_list_view.dart';
import 'package:food_app/widgets/restaurant_info.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
              Icons.arrow_back_ios_new_outlined, Icons.search_outlined),
          ResstaurantInfo(),
          FoodList(selected, (int index) {
            setState(() {
              selected = index;
            });
            pageController.jumpToPage(index);
          }, restaurant),
          Expanded(
              child: FoodListView(selected, (int index) {
            setState(() {
              selected = index;
            });
          }, pageController, restaurant)),
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                    width: 8,
                    height: 8,
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)),
                activeDotDecoration: DotDecoration(
                    width: 10,
                    height: 10,
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8)),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        elevation: 2,
        child: Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 25,),
      ),
    );
  }
}
