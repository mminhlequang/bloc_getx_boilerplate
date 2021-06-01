part of 'bloc.dart';

@immutable
abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationLoaded extends NavigationEvent {

  const NavigationLoaded();

  @override
  List<Object> get props => [];
}