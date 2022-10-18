import 'package:bloc/bloc.dart';
import 'package:stream_dart/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() :super(CounterState(counterValue: 1,wasIncerement: false));

  void incerement() => emit(CounterState(counterValue: state.counterValue + 1, wasIncerement: true));


  void decerement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncerement:
  false));
}