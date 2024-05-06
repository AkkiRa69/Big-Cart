// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_import

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  MyBottomNavBar({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      onTap: (value) {
        onTap(value);
      },
      height: 60,
      buttonBackgroundColor: Color(0xff6CC51D),
      items: [
        Icon(
          Icons.home_filled,
          color: index == 0 ? Colors.white : Colors.black,
        ),
        Icon(
          Icons.person,
          color: index == 1 ? Colors.white : Colors.black,
        ),
        Icon(
          Icons.favorite,
          color: index == 2 ? Colors.white : Colors.black,
        ),
        Icon(
          Icons.shopping_bag_outlined,
          color: index == 3 ? Colors.white : Colors.black,
        ),
      ],
    );
  }
}
