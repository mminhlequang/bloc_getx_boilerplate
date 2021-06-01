import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../../bloc/base_bloc/base_bloc.dart';

part 'event.dart';

part 'state.dart';

class NavigationBloc extends BaseBloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationLoadInProgress());

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is NavigationLoaded) {
      yield* _mapNavigationLoadedToState(event);
    }
  }

  Stream<NavigationState> _mapNavigationLoadedToState(
      NavigationLoaded event) async* {
    try {
      yield NavigationLoadInProgress();
      await Future.delayed(Duration(seconds: 2));
      yield NavigationLoadSuccess();
    } catch (e) {
      yield NavigationLoadFailure(e);
    }
  }
}
