import 'package:coffee_app/widgets/detail_page/detail_buttons.dart';
import 'package:coffee_app/widgets/welcome_page/app_large_text.dart';
import 'package:coffee_app/widgets/welcome_page/app_medium_text.dart';
import 'package:coffee_app/widgets/welcome_page/responsive_button.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height + 100,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/welcome-one.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 370,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AppLargeText(text: 'Arabica', color: Colors.black54),
                          AppLargeText(text: '\$250', color: Colors.black),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5),
                          AppMediumText(
                            text: 'USA, California',
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: gottenStars > index
                                    ? Colors.yellow
                                    : Colors.grey,
                              );
                            }),
                          ),
                          const SizedBox(width: 10),
                          const AppMediumText(
                            text: '(4.0)',
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      AppLargeText(
                        text: 'People',
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      const AppMediumText(
                        text: 'Number of people in your group',
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: DetailButtons(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                                size: 50,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      const AppLargeText(
                          text: 'Description', color: Colors.black, size: 20),
                      const SizedBox(height: 5),
                      const AppMediumText(
                          color: Colors.grey,
                          text:
                              'Black coffee is as simple as it gets with ground coffee beans steeped in hot water, served warm. And if you want to sound fancy, you can call black coffee by its proper name: cafe noir.'),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DetailButtons(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            borderColor: Colors.grey,
                            size: 60,
                            icon: Icons.favorite_border,
                            isIcon: true,
                          ),
                          const SizedBox(width: 20),
                          ResponsiveButton(
                            isResponsive: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
