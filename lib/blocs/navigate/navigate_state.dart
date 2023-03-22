part of 'navigate_bloc.dart';

abstract class NavigateState extends Equatable {
  const NavigateState();
  
  @override
  List<Object> get props => [];
}

class NavigateInitial extends NavigateState {}
