import 'package:flutter/material.dart';

class AppSmallText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  const AppSmallText({
    Key? key,
    this.size = 16,
    required this.text,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
