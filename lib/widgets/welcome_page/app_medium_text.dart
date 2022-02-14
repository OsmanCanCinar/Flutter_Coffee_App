import 'package:flutter/material.dart';

class AppMediumText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  const AppMediumText({
    Key? key,
    this.size = 16,
    required this.text,
    this.color = Colors.white60,
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
