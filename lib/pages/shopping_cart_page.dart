// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store/model/fruit_model.dart';
import 'package:grocery_store/pages/home_page.dart';
import 'package:grocery_store/pages/shipping_method_page.dart';
import 'package:grocery_store/providers/fruit_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    List<FruitModel> fruits = context.watch<FruitProvider>().shoppingCart;
    double total = context.watch<FruitProvider>().totalPrice(fruits);
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: HomePage(), type: PageTransitionType.leftToRight));
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text("Shopping Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                itemCount: fruits.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    secondaryBackground: _buildDismissibleRightToLeft(),
                    background: _buildDismissibleLeftToRight(),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        context
                            .read<FruitProvider>()
                            .removeProductFromCart(fruits[index]);
                      });
                    },
                    key: UniqueKey(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //images + detail
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                  ),
                                  Positioned(
                                    top: 0,
                                    child: Container(
                                      height: 70,
                                      width: 70,
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
                                      height: 70,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$" +
                                          fruits[index]
                                              .price
                                              .toStringAsFixed(2),
                                      style: TextStyle(
                                        color: Color(0xFF6CC51D),
                                      ),
                                    ),
                                    Text(
                                      fruits[index].name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      fruits[index].weight,
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    fruits[index].qty++;
                                  });
                                },
                                child: Icon(
                                  color: Colors.green,
                                  CupertinoIcons.add,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                child: Text(
                                  (fruits[index].qty).toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (fruits[index].qty <= 0) {
                                      return;
                                    }
                                    fruits[index].qty--;
                                  });
                                },
                                child: Icon(
                                  color: Colors.green,
                                  CupertinoIcons.minus,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //subtotal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF868889),
                      ),
                    ),
                    Text(
                      "\$" + total.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF868889),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                //shipping charges
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping charges",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF868889),
                      ),
                    ),
                    Text(
                      "\$" + 1.6.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF868889),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                //divider
                Divider(
                  thickness: 0.5,
                ),
                //TOtal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$" + (total + 1.6).toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                //button checkout
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        // Colors.white,
                        Color.fromARGB(255, 190, 249, 192),
                        Color.fromARGB(255, 136, 241, 140),
                        const Color.fromARGB(255, 95, 236, 100),
                      ],
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(18),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: ShoppingMethodPage(),
                              type: PageTransitionType.rightToLeft));
                    },
                    child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDismissibleRightToLeft() {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 30),
    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 17),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(
      Icons.delete,
      size: 40,
      color: Colors.white,
    ),
  );
}

Widget _buildDismissibleLeftToRight() {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 30),
    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 17),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(
      Icons.delete,
      size: 40,
      color: Colors.white,
    ),
  );
}
