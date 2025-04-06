import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  final int? maxLines; // Added maxLines parameter
  final TextOverflow? overflow; // Added overflow parameter

  SmallText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 8,
    this.height = 1.0,
    this.maxLines, // Added to constructor
    this.overflow, // Added to constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines, // Use maxLines
      overflow: overflow, // Use overflow
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}