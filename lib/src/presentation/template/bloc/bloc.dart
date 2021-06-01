import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../bloc/base_bloc/base_bloc.dart';

part 'event.dart';

part 'state.dart';

class Bloc extends BaseBloc<Event, State> {
  Bloc() : super(LoadInProgress());

  @override
  Stream<State> mapEventToState(
    Event event,
  ) async* {
    if (event is Loaded) {
      yield* _mapLoadedToState(event);
    }
  }

  Stream<State> _mapLoadedToState(
      Loaded event) async* {
    try {
      yield LoadInProgress();
      await Future.delayed(Duration(seconds: 2));
      yield LoadSuccess();
    } catch (e) {
      yield LoadFailure(e);
    }
  }
}
