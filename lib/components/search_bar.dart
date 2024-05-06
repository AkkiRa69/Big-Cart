import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
