part of 'matches_bloc.dart';

abstract class MatchesEvent extends Equatable {
  const MatchesEvent();
}

class LoadMatchesEvent extends MatchesEvent {
  final String username;

  LoadMatchesEvent(this.username);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
