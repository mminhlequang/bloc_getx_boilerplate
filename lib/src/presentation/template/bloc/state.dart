part of 'bloc.dart';

abstract class State extends Equatable {
  const State();

  @override
  List<Object> get props => [];
}

class LoadInProgress extends State {}

class LoadSuccess extends State {
  const LoadSuccess();
}

class LoadFailure extends State {
  final dynamic error;

  const LoadFailure(this.error);

  @override
  List<Object> get props => [error];
}

enum AccountStatus { active, code_pending, susppend }
