import 'package:bloc/bloc.dart';
import 'package:coffee_app/model/data_model.dart';
import 'package:coffee_app/services/data_services.dart';
import 'app_cubit_state.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final coffees;

  void getData() async {
    try {
      emit(LoadingState());
      coffees = await data.getInfo();
      emit(LoadedState(coffees));
    } catch (e) {}
  }

  void detailPage(DataModel data) {
    emit(DetailState(data));
  }

  void goHome() {
    emit(LoadedState(coffees));
  }
}
