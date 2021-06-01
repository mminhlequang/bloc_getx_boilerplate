part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoadInProgress extends AuthState {}

class AuthLoadSuccess extends AuthState {
  final dynamic user;

  const AuthLoadSuccess(this.user);
}

class LogoutSuccess extends AuthState {}

class AuthLoadFailure extends AuthState {
  final dynamic error;

  const AuthLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}

enum AccountStatus { active, code_pending, susppend }
