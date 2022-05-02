import 'package:chuckapp/dio/client.dart';
import 'package:chuckapp/screen/categories_page.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var loading = false;
  late DioClient dioClient;
  late Future<List<dynamic>> categories;

  @override
  void initState() {
    super.initState();
    dioClient = DioClient();
    categories = dioClient.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Categories",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        FutureBuilder<List<dynamic>>(
            future: categories,
            builder: (context, snapshot) {
              debugPrint("${snapshot.data}}");
              if (snapshot.hasData) {
                return Center(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1,
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            debugPrint("${snapshot.data![index]}");
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SpecificCategoryJoke(
                                  category: snapshot.data![index] as String);
                            }));
                          },
                          child: Card(

                              // style: ButtonStyle(elevation: MaterialStateProperty.all(0) ,backgroundColor:  MaterialStateProperty.all(Colors.grey),padding:MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 3,vertical: 2)),textStyle: MaterialStateProperty.all(TextStyle(color: Colors.black))),
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).colorScheme.secondary),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data![index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ))),
                      // separatorBuilder: (_, index) => SizedBox(height: 10),
                      itemCount: snapshot.data!.length),
                ));
              } else if (snapshot.hasError) {
                return const Text("Couldn't fetch data at the moment");
              }
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                )),
              );
            }),
      ],
    );
  }
}
