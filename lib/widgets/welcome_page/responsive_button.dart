import 'package:coffee_app/util/color_converter.dart';
import 'package:coffee_app/widgets/welcome_page/app_medium_text.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({this.width = 120, this.isResponsive = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? buttonColor = ColorConverter.getColorFromHex('#967957');

    return Container(
      width: isResponsive == true ? 200 : width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor,
      ),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? const AppMediumText(
                  text: 'Purchase Coffee Now',
                  color: Colors.white,
                )
              : Image.asset('assets/images/forward-button.png'),
        ],
      ),
    );
  }
}
