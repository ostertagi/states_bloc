import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

part 'request_event.dart';
part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  RequestBloc() : super(RequestState.initial()) {
    on<RequestEvent>((event, emit) {
      emit(state.copyWith(loading: event.loading, error: event.error));
    });
  }
}
