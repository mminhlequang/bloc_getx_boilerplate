import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoadInProgress()) {
    on<AuthLoaded>(_mapAuthLoadedToState);
    on<LogoutEvent>(_mapLogoutToState);
  }

  _mapAuthLoadedToState(AuthLoaded event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadInProgress());
      await Future.delayed(Duration(seconds: 2));
      emit(AuthLoadSuccess({}));
    } catch (e) {
      emit(AuthLoadFailure(e));
    }
  }

  _mapLogoutToState(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      emit(LogoutSuccess());
    } catch (e) {
      emit(AuthLoadFailure(e));
    }
  }
}
