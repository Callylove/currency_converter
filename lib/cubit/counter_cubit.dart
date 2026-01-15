import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<double> {
  CounterCubit() : super(0);

  void currencyConverter(value){
    final state = double.parse(value)  * 81;
    emit(state);
  }
}