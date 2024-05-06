// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocery_store/components/banner.dart';
import 'package:grocery_store/components/categories.dart';
import 'package:grocery_store/components/features_product.dart';
import 'package:grocery_store/components/search_bar.dart';
import 'package:grocery_store/model/fruit_model.dart';
import 'package:grocery_store/pages/category_page.dart';
import 'package:grocery_store/pages/product_detail_page.dart';
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
  final List cates = [
    ["Vegetables", "assets/icons/Vegetables.png"],
    ["Fruits", "assets/icons/Fruits.png"],
    ["Beverages", "assets/icons/Beverages.png"],
    ["Grocery", "assets/icons/Grocery.png"],
    ["Edible Oil", "assets/icons/Edible_oil.png"],
    ["Household", "assets/icons/Household.png"],
    ["Babycare", "assets/icons/baby.png"],
  ];

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
          ),
          type: PageTransitionType.rightToLeft),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<FruitModel> fruits = context.watch<FruitProvider>().fruitList;
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
                MySearchBar(),

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
                Categories(
                  cates: cates,
                  colors: colors,
                  fruits: fruits,
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
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: fruits.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 17,
                        mainAxisSpacing: 17,
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.5),
                    itemBuilder: (context, index) {
                      return Product(
                        onPressed: () {
                          context
                              .read<FruitProvider>()
                              .addProductToFavorites(fruits[index]);
                          setState(() {
                            fruits[index].isFav = !fruits[index].isFav;
                            if (fruits[index].isFav == false) {
                              context
                                  .read<FruitProvider>()
                                  .removeProductFavorite(fruits[index]);
                            }
                          });
                        },
                        isFav: fruits[index].isFav,
                        fruits: fruits[index],
                        onTap: () {
                          navigateToProductDetail(context, fruits[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
