import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  late int _value;

  CounterBloc() : super(CounterState.initial()) {
    _value = state.value;
    on<CounterEvent>(mapEventToState);
  }

  void mapEventToState(CounterEvent event, Emitter<CounterState> emit) async {
    if (event is IncrementCounterEvent) {
      //_value = event.value + 1;
      _value = state.value + 1;
    }
    if (event is DecrementCounterEvent) { 
      _value = state.value - 1;
    }
    emit(getBlocState());
  }

  CounterState getBlocState() {
    return CounterState(
      value: _value,
    );
  }
}
