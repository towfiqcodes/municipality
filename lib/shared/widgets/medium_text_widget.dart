import 'package:flutter/material.dart';

class MediumSizeText extends StatelessWidget {
  final String text;
  Color? color;
  FontWeight? weight;
  double? size;
  MediumSizeText({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.weight = FontWeight.bold,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
