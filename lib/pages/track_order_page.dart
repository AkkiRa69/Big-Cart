// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_store/components/timeline_tile.dart';
import 'package:grocery_store/model/fruit_model.dart';
import 'package:grocery_store/providers/fruit_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<FruitModel> fruits = context.watch<FruitProvider>().shoppingCart;
    double totalPrice = context.watch<FruitProvider>().totalPrice(fruits);
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text("Track Order"),
        centerTitle: true,
      ),
      body: _buildBody(context, fruits, totalPrice),
    );
  }

  Widget _buildBody(
      BuildContext context, List<FruitModel> fruits, double total) {
    return Container(
      child: ListView(
        children: [
          //order
          Container(
            margin: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(17),
            child: Row(
              children: [
                Container(
                  width: 66,
                  height: 66,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEBFFD7),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Image.asset(
                    "assets/icons/box1.png",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Order #${9087}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Placed on ${DateFormat('MMMM dd yyyy').format(DateTime.now())}",
                      style: TextStyle(color: Color(0xFF868889)),
                    ),
                    Row(
                      children: [
                        Text(
                          "Items: ${fruits.length}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Items: ${"\$" + (total + 1.6).toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          //timeline tile
          MyTimeLineTile(isFirst: true, isLast: false, isPast: true),
          MyTimeLineTile(isFirst: false, isLast: false, isPast: true),
          MyTimeLineTile(isFirst: false, isLast: true, isPast: false),
        ],
      ),
    );
  }
}
