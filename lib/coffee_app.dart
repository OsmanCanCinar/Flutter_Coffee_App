import 'package:coffee_app/cubit/app_cubit_logic.dart';
import 'package:coffee_app/cubit/app_cubits.dart';
import 'package:coffee_app/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeApp extends StatefulWidget {
  const CoffeeApp({Key? key}) : super(key: key);

  @override
  _CoffeeAppState createState() => _CoffeeAppState();
}

class _CoffeeAppState extends State<CoffeeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices()
        ),
        child: const AppCubitLogic(),
      ),
    );
  }
}
