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
      color: Color(0xFFFFCEC1),
      image: "assets/fruits/peach.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Avacoda",
      price: 7.00,
      weight: "dozen",
      qty: 0,
      color: Color(0xFFFCFFD9),
      image: "assets/fruits/aocado.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Pineapple",
      price: 9.90,
      weight: "dozen",
      qty: 0,
      color: Color(0xFFFFE6C2),
      image: "assets/fruits/pineapple-pieces.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Black Grapes",
      price: 7.05,
      weight: "dozen",
      qty: 0,
      color: Color(0xFFFEE1ED),
      image: "assets/fruits/grapes.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Pomegranate",
      price: 2.09,
      weight: "dozen",
      qty: 0,
      color: Color(0xFFFFE3E2),
      image: "assets/fruits/pomegranate.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Fresh Broccoli",
      price: 3.00,
      weight: "dozen",
      qty: 0,
      color: Color(0xFFD2FFD0),
      image: "assets/fruits/green-fresh-broccoli.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
    FruitModel(
      name: "Organic Lemons",
      price: 2.22,
      weight: "dozen",
      qty: 0,
      color: Color(0xFFF2FFE6),
      image: "assets/fruits/lime.png",
      description:
          "Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing more",
    ),
  ];

  List<FruitModel> get fruitList => _fruits;

  // FruitModel fruit = FruitModel();
}
