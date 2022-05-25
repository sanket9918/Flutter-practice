import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/food.dart';

class FoodImg extends StatelessWidget {
  final Food food;

  const FoodImg(this.food);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: kbackgroundColor),
                    ))
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(-1,1),
                      blurRadius: 15
                    )
                  ]
                ),
                margin: const EdgeInsets.all(15),
                child: Image.asset(food.imgUrl,fit: BoxFit.cover,),

              ),
            )
          ],
        ));
  }
}
