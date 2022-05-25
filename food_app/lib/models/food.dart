class Food {
  String imgUrl;
  String desc;
  String name;
  String waitTime;
  num score;
  String cal;
  num price;
  num quantity;
  List<Map<String, String>> ingredients;
  String about;
  bool highlight;

  Food(this.imgUrl, this.desc, this.name, this.waitTime, this.score, this.cal,
      this.price, this.quantity, this.ingredients, this.about,
      {this.highlight = false});

  static List<Food> generateRecommendedFood() {
    return [
      Food(
          'assets/images/dish1.png',
          "No.1 in sales",
          "Boba soup",
          "50 min",
          325,
          "200 kcal",
          12,
          1,
          [
            {"Noodle": "assets/images/ingre1.png"},
            {"Shrimp": "assets/images/ingre2.png"},
            {"Egg": "assets/images/ingre3.png"}
          ],
          "Something very delicious",
          highlight: true),
      Food(
          'assets/images/dish2.png',
          "low fat",
          "Kuch bhi",
          "50 min",
          325,
          "200 kcal",
          12,
          1,
          [
            {"Noodle": "assets/images/ingre1.png"},
            {"Shrimp": "assets/images/ingre2.png"},
            {"Egg": "assets/images/ingre3.png"}
          ],
          "Something very delicious",
          highlight: false),
          Food(
          'assets/images/dish2.png',
          "low fat",
          "Kuch bhi",
          "50 min",
          325,
          "200 kcal",
          12,
          1,
          [
            {"Noodle": "assets/images/ingre1.png"},
            {"Shrimp": "assets/images/ingre2.png"},
            {"Egg": "assets/images/ingre3.png"}
          ],
          "Something very delicious",
          highlight: false),
          Food(
          'assets/images/dish2.png',
          "low fat",
          "Kuch bhi",
          "50 min",
          325,
          "200 kcal",
          12,
          1,
          [
            {"Noodle": "assets/images/ingre1.png"},
            {"Shrimp": "assets/images/ingre2.png"},
            {"Egg": "assets/images/ingre3.png"}
          ],
          "Something very delicious",
          highlight: false),
          Food(
          'assets/images/dish2.png',
          "low fat",
          "Kuch bhi",
          "50 min",
          325,
          "200 kcal",
          12,
          1,
          [
            {"Noodle": "assets/images/ingre1.png"},
            {"Shrimp": "assets/images/ingre2.png"},
            {"Egg": "assets/images/ingre3.png"}
          ],
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          highlight: false),
    ];
  }

  static List<Food> generatePopularFood(){
    return  [
      Food(
          'assets/images/dish3.png',
          "No.1 in sales",
          "Bekar Soup",
          "50 min",
          325,
          "200 kcal",
          12,
          1,
          [
            {"Noodle": "assets/images/ingre1.png"},
            {"Shrimp": "assets/images/ingre4.png"},
            {"Egg": "assets/images/ingre3.png"}
          ],
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          highlight: true),
      Food(
          'assets/images/dish4.png',
          "low fat",
          "Badhiya Khana",
          "50 min",
          325,
          "200 kcal",
          12,
          1,
          [
            {"Noodle": "assets/images/ingre2.png"},
            {"Shrimp": "assets/images/ingre3.png"},
            {"Egg": "assets/images/ingre4.png"}
          ],
          "Something very delicious",
          highlight: false),
    ];
  }
}
