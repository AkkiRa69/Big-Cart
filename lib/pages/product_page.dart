// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_store/components/fearues_product.dart';
import 'package:grocery_store/model/fruit_model.dart';
import 'package:grocery_store/pages/product_detail_page.dart';
import 'package:page_transition/page_transition.dart';

class ProductPage extends StatelessWidget {
  final List fruits;
  final String title;
  const ProductPage({super.key, required this.fruits, required this.title});

  void navigateToProductDetail(BuildContext context, FruitModel fruits) {
    Navigator.push(
      context,
      PageTransition(
          child: ProductDetailPage(
            fruit: fruits,
          ),
          type: PageTransitionType.rightToLeft),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text(title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/filter.png",
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 17),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: fruits.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 17,
              mainAxisSpacing: 17,
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.45),
          itemBuilder: (context, index) {
            return Product(
              fruits: fruits[index],
              onTap: () {
                navigateToProductDetail(context, fruits[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
