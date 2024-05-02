import 'package:flutter/material.dart';
import 'package:grocery_store/pages/shopping_cart_page.dart';
import 'package:page_transition/page_transition.dart';

class MyBottomNavBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  MyBottomNavBar({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      backgroundColor: Color(0xFFFFFFFF),
      currentIndex: index,
      unselectedItemColor: Color(0xFF868889),
      selectedItemColor: Color(0xFF040404),
      iconSize: 25,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 50,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: ShoppingCartPage(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
          label: "",
        ),
      ],
    );
  }
}
