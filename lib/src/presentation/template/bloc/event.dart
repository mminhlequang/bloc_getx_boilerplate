part of 'bloc.dart';

@immutable
abstract class Event extends Equatable {
  const Event();

  @override
  List<Object> get props => [];
}

class Loaded extends Event {

  const Loaded();

  @override
  List<Object> get props => [];
}