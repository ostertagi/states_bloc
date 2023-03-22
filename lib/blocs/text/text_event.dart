part of 'text_bloc.dart';

abstract class TextEvent extends Equatable {
  const TextEvent();

  @override
  List<Object?> get props => [];
}

class FontSizeTextEvent extends TextEvent {
  final double value;

  const FontSizeTextEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class BoldTextEvent extends TextEvent {
  final bool value;

  const BoldTextEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class ItalicTextEvent extends TextEvent {
  final bool value;

  const ItalicTextEvent(this.value);

  @override
  List<Object?> get props => [value];
}


//class FontSizeTextEvent extends TextEvent {}
//class BoldTextEvent extends TextEvent {}
//class ItalicTextEvent extends TextEvent {}