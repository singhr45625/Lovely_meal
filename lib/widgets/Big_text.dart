import 'package:flutter/material.dart';
import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size; // Change this if it's dynamic or Object
  final TextOverflow overflow;

  BigText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? Dimensions.font20() : size.toDouble(), // Explicit cast here
        fontWeight: FontWeight.w400,
      ),
    );
  }
}