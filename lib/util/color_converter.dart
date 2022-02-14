import 'package:flutter/material.dart';

class ColorConverter {
  final String hexCode;

  ColorConverter(this.hexCode);

  static List<Color> getPageColors() {
    List<Color> colorList = <Color>[];
    List<String> colors = ['#967957', '#331E00', '#00C9AF', '#DFE0DF'];

    for (var i = 0; i < colors.length; i++) {
      colors[i] = colors[i].replaceAll('#', '');

      if (colors[i].length == 6) {
        colors[i] = 'FF' + colors[i];
      }

      if (colors[i].length == 8) {
        colorList.add(Color(int.parse('0x${colors[i]}')));
      }
    }

    return colorList;
  }

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse("0x$hexColor"));
  }
}

/*
  static List<Color> getColorsFromHex(List<String> colors) {
    List<Color> colorList = <Color>[];

    for (var i = 0; i < colors.length; i++) {
      colors[i] = colors[i].replaceAll('#', '');

      if (colors[i].length == 6) {
        colors[i] = 'FF' + colors[i];
      }

      if (colors[i].length == 8) {
        colorList.add(Color(int.parse('0x${colors[i]}')));
      }
    }

    return colorList;
  }

  static List<Color> getColors(String appBarColor, String backgroundColor) {
    appBarColor = appBarColor.replaceAll("#", "");
    backgroundColor = backgroundColor.replaceAll("#", "");

    if (appBarColor.length == 6 && backgroundColor.length == 6) {
      appBarColor = "FF" + appBarColor;
      backgroundColor = "FF" + backgroundColor;
    }

    Color appBar = Color(int.parse("0x$appBarColor"));
    Color background = Color(int.parse("0x$backgroundColor"));

    List<Color> colorList = [appBar, background];

    return colorList;
  }
 */