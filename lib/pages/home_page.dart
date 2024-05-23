// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_store/components/banner.dart';
import 'package:grocery_store/components/per_category.dart';
import 'package:grocery_store/components/product.dart';
import 'package:grocery_store/components/search_bar.dart';
import 'package:grocery_store/model/fruit_model.dart';
import 'package:grocery_store/pages/category_page.dart';
import 'package:grocery_store/pages/controller_page.dart';
import 'package:grocery_store/pages/filter_page.dart';
import 'package:grocery_store/pages/product_detail_page.dart';
import 'package:grocery_store/pages/product_page.dart';
import 'package:grocery_store/pages/search_tap_page.dart';
import 'package:grocery_store/providers/fruit_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final List<Color> colors = [
    Color(0xFFE6F2EA),
    Color(0xFFFFE9E5),
    Color(0xFFFFF6E3),
    Color(0xFFF3EFFA),
    Color(0xFFDCF4F5),
    Color(0xFFFFE8F2),
    Color(0xFFD2EFFF),
  ];

  void navigateToProductDetail(BuildContext context, FruitModel fruits) {
    Navigator.push(
      context,
      PageTransition(
          child: ProductDetailPage(
            fruit: fruits,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: ControllerPage(),
                      type: PageTransitionType.leftToRight));
            },
          ),
          type: PageTransitionType.rightToLeft),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<FruitModel> fruits = context.watch<FruitProvider>().fruitList;
    List cates = context.watch<FruitProvider>().cates;
    return DefaultTabController(
      length: cates.length,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFF4F5F9),
                ],
              ),
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                //search bar
                MySearchBar(
                  searchTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: SearchTapPage(),
                          type: PageTransitionType.leftToRight),
                    );
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: FilterPage(),
                        type: PageTransitionType.bottomToTop,
                        duration: Duration(
                            milliseconds: 300), // Adjust duration as needed
                        reverseDuration: Duration(
                            milliseconds:
                                300), // Adjust reverse duration as needed
                        curve: Curves
                            .easeInOut, // Add a curve for smooth animation
                      ),
                    );
                  },
                ),

                //banner
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MyBanner(),
                ),

                //Categories
                Padding(
                  padding: const EdgeInsets.only(left: 17, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CategoryPage(
                                    fruits: fruits,
                                    cates: cates,
                                    colors: colors,
                                  ),
                                  type: PageTransitionType.bottomToTop));
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  padding: const EdgeInsets.only(left: 17),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < cates.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: PerCategory(
                            backColor: Colors.transparent,
                            cates: cates[i],
                            colors: colors[i],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: ProductPage(
                                          fruits: fruits, title: cates[i][0]),
                                      type: PageTransitionType.bottomToTop));
                            },
                          ),
                        ),
                    ],
                  ),
                ),

                //features product
                Padding(
                  padding: const EdgeInsets.only(left: 17, top: 12, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Features Product",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: ProductPage(
                                      fruits: fruits, title: "Vegetables"),
                                  type: PageTransitionType.bottomToTop));
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (fruits.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    int firstIndex = index * 2;
                    int secondIndex = firstIndex + 1;
                    double height = 280;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 17.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: height,
                              child: buildProduct(fruits[firstIndex]),
                            ),
                          ),
                          SizedBox(
                              width: 17), // Horizontal spacing between columns
                          if (secondIndex < fruits.length)
                            Expanded(
                              child: SizedBox(
                                height: height,
                                child: buildProduct(fruits[secondIndex]),
                              ),
                            )
                          else
                            Expanded(
                              child: SizedBox(
                                  height:
                                      height), // Placeholder for layout alignment
                            ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProduct(FruitModel fruits) {
    return Product(
      onPressed: () {
        context.read<FruitProvider>().addProductToFavorites(fruits);
        setState(() {
          fruits.isFav = !fruits.isFav;
          if (!fruits.isFav) {
            context.read<FruitProvider>().removeProductFavorite(fruits);
          }
        });
      },
      isFav: fruits.isFav,
      fruits: fruits,
      onTap: () {
        navigateToProductDetail(context, fruits);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
