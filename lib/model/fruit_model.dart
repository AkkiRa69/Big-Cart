import 'dart:ui';

class FruitModel {
  String name, weight, description, image;
  double price;
  int qty, rate, review;
  var color;
  bool isFav;

  FruitModel(
      {this.name = "no-name",
      this.description = "no description",
      this.image = "no image",
      this.price = 0.00,
      this.rate = 4,
      this.review = 90,
      this.weight = "no-weight",
      this.color = const Color(0xFFFFE3E2),
      this.qty = 0,
      this.isFav = false});
}
