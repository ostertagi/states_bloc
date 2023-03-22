part of 'slide_bloc.dart';
 
class SlideState extends Equatable {
  final double slider;

  const SlideState({
    required this.slider,
  });

  factory SlideState.initial() {
    return const SlideState(slider: 0.5);
  }

  SlideState copyWith({
    double? slider,
  }) {
    return SlideState(
      slider: slider ?? this.slider,
    );
  }

  @override
  List<Object> get props => [slider];
}
