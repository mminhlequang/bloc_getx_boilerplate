import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthLoadInProgress());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthLoaded) {
      yield* _mapAuthLoadedToState(event);
    } else if (event is LogoutEvent) {
      yield* _mapLogoutToState(event);
    }
  }

  Stream<AuthState> _mapAuthLoadedToState(AuthLoaded event) async* {
    try {
      yield AuthLoadInProgress();
      await Future.delayed(Duration(seconds: 2));
      yield AuthLoadSuccess({});
    } catch (e) {
      yield AuthLoadFailure(e);
    }
  }

  Stream<AuthState> _mapLogoutToState(LogoutEvent event) async* {
    try {
      await Future.delayed(Duration(seconds: 1));
      yield LogoutSuccess();
    } catch (e) {
      yield AuthLoadFailure(e);
    }
  }
}
