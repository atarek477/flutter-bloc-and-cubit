

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial());

  void increment(){
    emit(CounterStateNumber(state.count+1));
  }

  void decrement(){
    emit(CounterStateNumber(state.count-1));
  }
}

