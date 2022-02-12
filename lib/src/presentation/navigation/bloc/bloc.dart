import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/base_bloc/base_bloc.dart';

part 'event.dart';

part 'state.dart';

class NavigationBloc extends BaseBloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationLoadInProgress()) {
    on<NavigationLoaded>(_mapNavigationLoadedToState);
  }

  _mapNavigationLoadedToState(NavigationLoaded event, Emitter<NavigationState> emit) async {
    try {
      emit(NavigationLoadInProgress());
      await Future.delayed(Duration(seconds: 2));
      emit(NavigationLoadSuccess());
    } catch (e) {
      emit(NavigationLoadFailure(e));
    }
  }
}
