import 'package:bloc/bloc.dart';
import 'package:coffee_app/cubit/app_cubits.dart';
import 'package:coffee_app/util/color_converter.dart';
import 'package:coffee_app/util/landing_data.dart';
import 'package:coffee_app/widgets/welcome_page/app_large_text.dart';
import 'package:coffee_app/widgets/welcome_page/app_medium_text.dart';
import 'package:coffee_app/widgets/welcome_page/app_small_text.dart';
import 'package:coffee_app/widgets/welcome_page/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<String> titles = LandingData.titles;
  List<String> subTitles = LandingData.subtitles;
  List<String> descriptions = LandingData.descriptions;
  List<String> imagePaths = LandingData.imagePaths;
  List<Color> selectedColors = ColorConverter.getPageColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: imagePaths.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/welcome-' + imagePaths[index] + '.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              margin: const EdgeInsets.fromLTRB(25, 120, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(
                        text: titles[index],
                        size: 35,
                        color: selectedColors[3],
                      ),
                      const SizedBox(height: 10),
                      AppMediumText(
                        text: subTitles[index],
                        size: 30,
                        color: selectedColors[0],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: (2 * MediaQuery.of(context).size.width / 3),
                        child: AppSmallText(
                          size: 18,
                          text: descriptions[index],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(bottom: 50),
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: SizedBox(
                              width: 200,
                              child: ResponsiveButton(width: 150.0)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(titles.length, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots
                              ? selectedColors[3]
                              : selectedColors[0],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
