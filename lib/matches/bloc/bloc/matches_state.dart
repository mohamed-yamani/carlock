part of 'matches_bloc.dart';

abstract class MatchesState extends Equatable {
  const MatchesState();
}

class MatchesInitial extends MatchesState {
  @override
  List<Object> get props => [];
}

class MatchesLoadedState extends MatchesState {
  final List<MatchModel> matches;
  final String username;

  MatchesLoadedState(
    this.matches,
    this.username,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        matches,
        this.username,
      ];
}
