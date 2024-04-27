import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  List cates;
  Categories({super.key,required this.cates});
  final List<Color> colors = [
    Color(0xFFE6F2EA),
    Color(0xFFFFE9E5),
    Color(0xFFFFF6E3),
    Color(0xFFF3EFFA),
    Color(0xFFDCF4F5),
    Color(0xFFFFE8F2),
  ];
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
              padding: const EdgeInsets.only(right: 17),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    decoration:
                        BoxDecoration(color: colors[i], shape: BoxShape.circle),
                    padding: EdgeInsets.all(15),
                    child: Image.asset(
                      cates[i][1],
                      // height: i == 1 ? 50 : 35,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(cates[i][0]),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
