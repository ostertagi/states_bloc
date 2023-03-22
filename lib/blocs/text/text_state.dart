part of 'text_bloc.dart';
 
class TextState extends Equatable {
  final double fontSize;
  final bool bold;
  final bool italic;

  const TextState({
    required this.fontSize,
    required this.bold,
    required this.italic,
  });

  factory TextState.initial() {
    return const TextState(fontSize: 12, bold: false, italic: false);
  }

  TextState copyWith({
    double? fontSize,
    bool? bold,
    bool? italic,
  }) {
    return TextState(
      fontSize: fontSize ?? this.fontSize,
      bold: bold ?? this.bold,
      italic: italic ?? this.italic,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [fontSize, bold, italic];
}
