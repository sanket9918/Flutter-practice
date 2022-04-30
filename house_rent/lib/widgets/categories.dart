import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final categoriesList = [
    "Top Recommended",
    "Near you",
    "Agency Recommended",
    "Most Popular"
  ];
  int currenSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (() {
              setState(() {
                currenSelected = index;
              });
            }),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: currenSelected == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 3))),
              child: Text(
                categoriesList[index],
                style: TextStyle(
                    color: currenSelected == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: currenSelected == index ? 16 : 14,
                    fontWeight: currenSelected == index
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ),
          ),
          separatorBuilder: (_, index) => SizedBox(
            width: 15,
          ),
          itemCount: categoriesList.length,
        ));
  }
}
