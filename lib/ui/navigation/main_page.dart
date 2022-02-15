import 'package:coffee_app/ui/navigation/bar_item_page.dart';
import 'package:coffee_app/ui/navigation/my_page.dart';
import 'package:coffee_app/ui/navigation/search_page.dart';
import 'package:coffee_app/util/color_converter.dart';
import 'package:flutter/material.dart';

import '../main/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Color iconColor = ColorConverter.getColorFromHex('#967957');

  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white24,
        currentIndex: currentIndex,
        selectedItemColor: iconColor,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apps,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: 'Bar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'My Page',
          ),
        ],
      ),
    );
  }
}
