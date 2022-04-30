class House {
  String name;
  String address;
  String imageUrl;

  House(this.name, this.address, this.imageUrl);

  static List<House> generateRecommended() {
    return [
      House("Sanket's House", "Sailashree Vihar", "assets/images/house01.jpeg"),
      House("Mohapatra's House", "Sailashree Vihar",
          "assets/images/house02.jpeg"),
    ];
  }

  static List<House> generateBestOffer() {
    return [
      House("Sanket's House", "Sailashree Vihar", "assets/images/offer01.jpeg"),
      House("Mohapatra's House", "Sailashree Vihar",
          "assets/images/offer02.jpeg"),
    ];
  }
}
