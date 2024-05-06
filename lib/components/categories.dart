import 'package:flutter/material.dart';
import 'package:grocery_store/components/per_category.dart';
import 'package:grocery_store/pages/product_page.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  List cates;
  List<Color> colors;
  List fruits;
  Categories(
      {super.key,
      required this.cates,
      required this.colors,
      required this.fruits});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.only(left: 17),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < cates.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: PerCategory(
                cates: cates[i],
                colors: colors[i],
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child:
                              ProductPage(fruits: fruits, title: cates[i][0]),
                          type: PageTransitionType.bottomToTop));
                },
              ),
            ),
        ],
      ),
    );
  }
}
