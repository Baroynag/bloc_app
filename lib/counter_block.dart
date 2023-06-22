import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on(_onIncrement);
    on(_onDecrement);
  }

  _onIncrement(CounterIncrementEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.count + 1));
  }

  _onDecrement(CounterDecrementEvent event, Emitter<CounterState> emit) {
    if (state.count > 0) {
      emit(state.copyWith(count: state.count - 1));
    }
  }
}
