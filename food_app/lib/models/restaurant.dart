import 'package:food_app/models/food.dart';

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String description;
  num score;

  Map<String, List<Food>> menu;

  Restaurant(this.name, this.waitTime, this.distance, this.label, this.logoUrl,
      this.description, this.score, this.menu);

  static Restaurant generateRestaurant() {
    // Since only one restaurant hence no need of list

    return Restaurant("Restaurant", "20-30 min", "3.0km", "Restaurant",
        "assets/images/res_logo.png", "Papdi chat is delicious here ", 4.8, {
      "Recommended": Food.generateRecommendedFood(),
      "Popular": Food.generatePopularFood(),
      "Some Category": [],
      "Bekar Category":[]
    });
  }
}
