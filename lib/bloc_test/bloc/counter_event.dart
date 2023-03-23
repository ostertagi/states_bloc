part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

/*
class IncrementCounterEvent extends CounterEvent {
  final int value;
  const IncrementCounterEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class DecrementCounterEvent extends CounterEvent {
  final int value;
  const DecrementCounterEvent(this.value);

  @override
  List<Object?> get props => [value];
}
*/