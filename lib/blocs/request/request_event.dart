part of 'request_bloc.dart';

class RequestEvent {
  final bool loading;
  final String error;

  const RequestEvent({
    required this.loading,
    required this.error,
  });
}
