// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_store/components/features_product.dart';
import 'package:grocery_store/model/fruit_model.dart';
import 'package:grocery_store/pages/product_detail_page.dart';
import 'package:grocery_store/providers/fruit_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final List fruits;
  final String title;
  const ProductPage({super.key, required this.fruits, required this.title});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
        title: Text(widget.title),
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
          itemCount: widget.fruits.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 17,
              mainAxisSpacing: 17,
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.50),
          itemBuilder: (context, index) {
            return Product(
              onPressed: () {
                context
                    .read<FruitProvider>()
                    .addProductToFavorites(widget.fruits[index]);
                setState(() {
                  widget.fruits[index].isFav = !widget.fruits[index].isFav;
                  if (widget.fruits[index].isFav == false) {
                    context
                        .read<FruitProvider>()
                        .removeProductFavorite(widget.fruits[index]);
                  }
                });
              },
              fruits: widget.fruits[index],
              isFav: widget.fruits[index].isFav,
              onTap: () {
                navigateToProductDetail(context, widget.fruits[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
