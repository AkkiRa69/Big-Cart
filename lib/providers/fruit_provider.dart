// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:grocery_store/model/fruit_model.dart';

class FruitProvider extends ChangeNotifier {
  List<FruitModel> _fruits = [
    FruitModel(
      name: "Fresh Peach",
      price: 8.00,
      weight: "dozen",
      qty: 0,
      image: "assets/fruits/peach.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Fresh Peach",
      price: 8.00,
      weight: "dozen",
      qty: 0,
      image: "assets/fruits/peach.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Fresh Peach",
      price: 8.00,
      weight: "dozen",
      qty: 0,
      image: "assets/fruits/peach.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Fresh Peach",
      price: 8.00,
      weight: "dozen",
      qty: 0,
      image: "assets/fruits/peach.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Fresh Peach",
      price: 8.00,
      weight: "dozen",
      qty: 0,
      image: "assets/fruits/peach.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Fresh Peach",
      price: 8.00,
      weight: "dozen",
      qty: 0,
      image: "assets/fruits/peach.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
  ];

  List<FruitModel> get fruitList => _fruits;
}
