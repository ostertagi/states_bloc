part of 'navigate_bloc.dart';

abstract class NavigateEvent extends Equatable {
  const NavigateEvent();

  @override
  List<Object?> get props => [];
}

class GoToPageEvent extends NavigateEvent {
  final String route;
  final Map<String, dynamic>? arguments;
  final bool replace;

  const GoToPageEvent(
      {required this.route, this.arguments, this.replace = false});

  @override
  List<Object?> get props => [route, arguments, replace];
}

class PopEvent extends NavigateEvent {}
