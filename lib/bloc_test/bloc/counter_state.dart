part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int value;

  const CounterState({
    required this.value,
  });

  factory CounterState.initial() {
    return const CounterState(value: 0);
  }

  CounterState copyWith({
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props => [value];
}
