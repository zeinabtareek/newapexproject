import 'package:flutter/material.dart';

class SmoothIndicator extends StatelessWidget {
  const SmoothIndicator({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 12.0,
        height: 12.0,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color));
  }
}
