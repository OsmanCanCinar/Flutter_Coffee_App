import 'package:coffee_app/model/data_model.dart';
import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.coffees);
  final List<DataModel> coffees;

  @override
  List<Object> get props => [coffees];
}

class DetailState extends CubitStates {
  DetailState(this.coffee);
  final DataModel coffee;

  @override
  List<Object> get props => [coffee];
}
