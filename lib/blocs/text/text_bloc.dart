import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart'; 
import 'package:states_bloc/blocs/slide/slide_bloc.dart';

part 'text_event.dart';
part 'text_state.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  late StreamSubscription _subscription;
  final SlideBloc slideBloc;

  late double _fontSize;
  late bool _bold;
  late bool _italic;

  TextBloc({required this.slideBloc}) : super(TextState.initial()) {
    _fontSize = state.fontSize;
    _bold = state.bold;
    _italic = state.italic;
    on<TextEvent>(mapEventToState);
    _subscription = slideBloc.stream.listen((state) {
      add(FontSizeTextEvent(state.slider * 30));
    });
  }

  void mapEventToState(TextEvent event, Emitter<TextState> emit) async {
    if (event is FontSizeTextEvent) {
      _fontSize = event.value;
    }

    if (event is BoldTextEvent) {
      _bold = event.value;
    }

    if (event is ItalicTextEvent) {
      _italic = event.value;
    }
    emit(getBlocState());
  }

  TextState getBlocState() {
    return TextState(
      fontSize: _fontSize,
      bold: _bold,
      italic: _italic,
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

/*
context .read<RegisterBloc>() .add(RegisterEventName(value))
*/