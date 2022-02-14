import 'package:coffee_app/util/color_converter.dart';
import 'package:coffee_app/util/home_data.dart';
import 'package:coffee_app/util/landing_data.dart';
import 'package:coffee_app/widgets/home_page/CircleTabIndicator.dart';
import 'package:coffee_app/widgets/welcome_page/app_large_text.dart';
import 'package:coffee_app/widgets/welcome_page/app_medium_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<Color> _colors = ColorConverter.getPageColors();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const AppLargeText(text: 'Discover', color: Colors.black54),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(color: _colors[1], radius: 4),
                  isScrollable: true,
                  tabs: const [
                    Tab(text: 'Places'),
                    Tab(text: 'Inspiration'),
                    Tab(text: 'Emotions'),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.only(left: 5),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/welcome-' +
                                    LandingData.imagePaths[index] +
                                    '.png',
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        );
                      },
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                    ),
                    Text('hi'),
                    Text('bye'),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: 'Explore more',
                    color: _colors[0],
                    size: 22,
                  ),
                  AppMediumText(text: 'See All', color: _colors[1]),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/' +
                                      HomeData.places.keys.elementAt(index) +
                                      '.png',
                                ),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          AppMediumText(
                            text: HomeData.places.values.elementAt(index),
                            color: _colors[0],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
