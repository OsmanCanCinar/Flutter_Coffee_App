import 'package:coffee_app/widgets/welcome_page/app_medium_text.dart';
import 'package:flutter/material.dart';

class DetailButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  String? text;
  IconData? icon;
  bool isIcon;

  DetailButtons({
    Key? key,
    this.isIcon = false,
    this.text = '0',
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppMediumText(text: text!, color: color),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
