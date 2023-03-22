import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'navigate_event.dart';
part 'navigate_state.dart';

class NavigateBloc extends Bloc<NavigateEvent, NavigateState> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigateBloc({required this.navigatorKey}) : super(NavigateInitial()) {
    on<NavigateEvent>(mapEventToState);
  }

  void mapEventToState(NavigateEvent event, Emitter<NavigateState> emit) async {
    if (event is PopEvent) {
      navigatorKey.currentState?.pop();
    } else if (event is GoToPageEvent) {
      navigatorKey.currentState?.pushNamed(event.route);
    }
    //emit(getBlocState());
  }
}

/*
class NavigateBloc extends Bloc<NavigateEvent, NavigateState> {
  NavigateBloc() : super(NavigateInitial()) {
    on<NavigateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}*/
