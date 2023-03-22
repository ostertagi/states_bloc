part of 'slide_bloc.dart';

abstract class SlideEvent extends Equatable {
  const SlideEvent();

  @override
  List<Object?> get props => [];
}

class ChangeSlideEvent extends SlideEvent {
  final double value;

  const ChangeSlideEvent(this.value);

  @override
  List<Object?> get props => [value];
}
