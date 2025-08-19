import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrement>((event, emit) {
     emit(CounterStateNumber(state.count+1));
    });
    on<CounterDecrement>((event, emit) {
      emit(CounterStateNumber(state.count-1));

    });
  }
}
