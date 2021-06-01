part of 'bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationLoadInProgress extends NavigationState {}

class NavigationLoadSuccess extends NavigationState {
  const NavigationLoadSuccess();
}

class NavigationLoadFailure extends NavigationState {
  final dynamic error;

  const NavigationLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}

enum AccountStatus { active, code_pending, susppend }
