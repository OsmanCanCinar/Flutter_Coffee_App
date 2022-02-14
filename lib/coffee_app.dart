import 'package:coffee_app/ui/main/detail_page.dart';
import 'package:coffee_app/ui/main_page.dart';
import 'package:coffee_app/ui/main/welcome_page.dart';
import 'package:flutter/material.dart';

class CoffeeApp extends StatefulWidget {
  const CoffeeApp({Key? key}) : super(key: key);

  @override
  _CoffeeAppState createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //body: WelcomePage(),
      //body: MainPage(),
      body: DetailPage(),
    );
  }
}
