// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_store/model/fruit_model.dart';
import 'package:grocery_store/providers/fruit_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> posters = [
    "poster1.jpg",
    "poster3.jpg",
    "poster4.jpg",
  ];

  final List cates = [
    ["Vegetables", "assets/icons/Vegetables.png"],
    ["Fruits", "assets/icons/Fruits.png"],
    ["Beverages", "assets/icons/Beverages.png"],
    ["Grocery", "assets/icons/Grocery.png"],
    ["Edible Oil", "assets/icons/Edible_oil.png"],
    ["Household", "assets/icons/Household.png"],
  ];

  final List<Color> colors = [
    Color(0xFFE6F2EA),
    Color(0xFFFFE9E5),
    Color(0xFFFFF6E3),
    Color(0xFFF3EFFA),
    Color(0xFFDCF4F5),
    Color(0xFFFFE8F2),
  ];

  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    List<FruitModel> fruits = context.watch<FruitProvider>().fruitList;
    return DefaultTabController(
      length: cates.length,
      child: Scaffold(
        backgroundColor: Color(0xFFF4F5F9),
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF4F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(3),
                margin: EdgeInsets.symmetric(horizontal: 17),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      "assets/icons/search.png",
                      color: Color(0xFF868889),
                    ),
                    hintText: "Search keywords...",
                    suffixIcon: Image.asset(
                      "assets/icons/filter.png",
                      color: Color(0xFF868889),
                    ),
                    hintStyle: TextStyle(color: Color(0xFF868889)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 250,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: posters.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 17),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "assets/images/${posters[index]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 20,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: posters.length,
                      effect: WormEffect(
                        activeDotColor: Color(0xFF6CC51D),
                        dotColor: Colors.white,
                        dotHeight: 7,
                        dotWidth: 7,
                      ),
                    ),
                  ),
                ],
              ),
              //Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 17),
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.only(right: 20),
                  isScrollable: true,
                  tabs: [
                    for (int i = 0; i < cates.length; i++)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Tab(
                            height: 70,
                            child: Container(
                              height: 65,
                              decoration: BoxDecoration(
                                  color: colors[i], shape: BoxShape.circle),
                              padding: EdgeInsets.all(15),
                              child: Image.asset(
                                cates[i][1],
                                height: 35,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(cates[i][0]),
                        ],
                      ),
                  ],
                ),
              ),
              //features product
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Text(
                      "Features Product",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),

              //Grid view
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
                      childAspectRatio: 1 / 1.45),
                  itemBuilder: (context, index) {
                    return Container(
                      // margin: EdgeInsets.all(8),
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
                                padding:
                                    const EdgeInsets.only(right: 10, top: 10),
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
                                    color: fruits[index].color,
                                    // borderRadius: BorderRadius.circular(50),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                // left: 5,
                                child: Image.asset(
                                  fruits[index].image,
                                  height: 80,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "\$" + fruits[index].price.toStringAsFixed(2),
                            style: TextStyle(
                              color: Color(0xFF6CC51D),
                            ),
                          ),
                          Text(
                            fruits[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            fruits[index].weight,
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
