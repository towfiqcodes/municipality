import 'package:flutter/material.dart';

class SmallSizeText extends StatelessWidget {
  final String text;
  Color? color;
  double? size;
  SmallSizeText(
      {Key? key, required this.text, this.color = Colors.white, this.size = 11})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
