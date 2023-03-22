part of 'request_bloc.dart';

class RequestState extends Equatable {
  final bool loading;
  final String error;

  const RequestState({
    required this.loading,
    required this.error,
  });

  factory RequestState.initial() {
    return const RequestState(loading: false, error: '');
  }

  bool get hasError => error.isNotEmpty;

  RequestState copyWith({
    bool? loading,
    String? error,
  }) {
    return RequestState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [loading, error];
}