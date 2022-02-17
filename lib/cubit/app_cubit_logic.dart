import 'package:coffee_app/cubit/app_cubit_state.dart';
import 'package:coffee_app/cubit/app_cubits.dart';
import 'package:coffee_app/ui/main/detail_page.dart';
import 'package:coffee_app/ui/main/welcome_page.dart';
import 'package:coffee_app/ui/navigation/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({Key? key}) : super(key: key);

  @override
  _AppCubitLogicState createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          } else if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return const MainPage();
          } else if (state is DetailState) {
            return const DetailPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
