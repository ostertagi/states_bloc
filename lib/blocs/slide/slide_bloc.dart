import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'slide_event.dart';
part 'slide_state.dart';

class SlideBloc extends Bloc<SlideEvent, SlideState> {
  late double _slider;

  SlideBloc() : super(SlideState.initial()) {
    _slider = state.slider;
    on<SlideEvent>(mapEventToState);
  }

  void mapEventToState(SlideEvent event, Emitter<SlideState> emit) async {
    if (event is ChangeSlideEvent) {
      _slider = event.value;
    }
    emit(getBlocState());
  }

  SlideState getBlocState() {
    return SlideState(
      slider: _slider,
    );
  }
}
 
/*
=========================
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterState(counter: 5);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield CounterState(counter: state.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(counter: state.counter - 1);
    }
  }
}
*/