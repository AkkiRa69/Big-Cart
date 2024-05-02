import 'package:flutter/material.dart';

class PerCategory extends StatelessWidget {
  final List cates;
  final Color colors;
  final void Function()? onTap;
  const PerCategory(
      {super.key,
      required this.cates,
      required this.colors,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFFFFBFB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(color: colors, shape: BoxShape.circle),
              padding: EdgeInsets.all(15),
              child: Image.asset(
                cates[1],
                fit: BoxFit.cover,
              ),
            ),
            Text(cates[0]),
          ],
        ),
      ),
    );
  }
}
