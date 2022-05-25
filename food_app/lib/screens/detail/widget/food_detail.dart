import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/screens/detail/widget/food_quantity.dart';

class FoodDetail extends StatelessWidget {
  final Food food;
  const FoodDetail(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(25),
        color: kbackgroundColor,
        child: Column(children: [
          Text(
            food.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconText(
                  Icons.access_time_outlined, Colors.blue, food.waitTime),
              _buildIconText(
                  Icons.star_outline, Colors.amber, food.score.toString()),
              _buildIconText(
                  Icons.local_fire_department_outlined, Colors.red, food.cal)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          FoodQuantity(food),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: const [
              Text(
                "Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(
                        children: [
                          Image.asset(
                            food.ingredients[index].values.first,
                            width: 52,
                          ),
                          Text(food.ingredients[index].keys.first)
                        ],
                      ),
                    ),
                separatorBuilder: (_, index) => const SizedBox(
                      width: 15,
                    ),
                itemCount: food.ingredients.length),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'About',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            food.about,
            style: const TextStyle(wordSpacing: 1.2, height: 1.5, fontSize: 16),
          ),
        ]));
  }
}

Widget _buildIconText(IconData icon, Color color, String text) {
  return Row(
    children: [
      Icon(
        icon,
        color: color,
        size: 20,
      ),
      Text(
        text,
        style: const TextStyle(fontSize: 16),
      )
    ],
  );
}
