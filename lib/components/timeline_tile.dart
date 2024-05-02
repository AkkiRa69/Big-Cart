import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst, isLast, isPast;
  MyTimeLineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      //decorate line stlye
      beforeLineStyle: LineStyle(
        color: Color(0xFFEBEBEB),
      ),
      //decorate icon stlye
    );
  }
}
