import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/models/food.dart';

class FoodItem extends StatelessWidget {
  final Food food;

  const FoodItem(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 110,
              height: 110,
              child: Image.asset(food.imgUrl, fit: BoxFit.fitHeight),
            ),
            Expanded(child: Container(
              padding: const EdgeInsets.only(
                top:20,
                left: 10,
                right: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(                     
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(food.name,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,height: 1.5),),
                        const Icon(Icons.arrow_forward_ios_outlined,size: 15,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(food.desc,style: TextStyle(
                    color: food.highlight ? kPrimaryColor : Colors.grey.withOpacity(0.8)
                  ),),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Text('\$',style: TextStyle(

                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),),
                      Text('${food.price}',style: TextStyle(

                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
