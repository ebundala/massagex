import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/notification.dart';

part 'deeplink_event.dart';
part 'deeplink_state.dart';

class DeeplinkBloc extends Bloc<DeeplinkEvent, DeeplinkState> {
  DeeplinkBloc() : super(DeeplinkInitial()) {
    on<DeeplinkEvent>((event, emit) => mapEventToState(event, emit));
  }

  Stream<DeeplinkState> mapEventToState(
      DeeplinkEvent event, Emitter<DeeplinkState> emit) async* {
    if (event is DeeplinkExcuted) {
      emit(DeeplinkTapped(data: event.data));
    } else {
      emit(DeeplinkInitial());
    }
  }
}
