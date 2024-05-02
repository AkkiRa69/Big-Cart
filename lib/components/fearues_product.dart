// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:grocery_store/model/fruit_model.dart';

class Product extends StatelessWidget {
  final FruitModel fruits;
  final void Function()? onTap;
  const Product({super.key, required this.fruits, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Icon(Icons.favorite_border),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 100,
                  width: 120,
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    height: 80,
                    width: 80,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: fruits.color,
                      // borderRadius: BorderRadius.circular(50),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  // left: 5,
                  child: Image.asset(
                    fruits.image,
                    height: 80,
                  ),
                ),
              ],
            ),
            Text(
              "\$" + fruits.price.toStringAsFixed(2),
              style: TextStyle(
                color: Color(0xFF6CC51D),
              ),
            ),
            Text(
              fruits.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              fruits.weight,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 5),
            Divider(
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/shop_bag.png",
                    height: 18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Add to cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
