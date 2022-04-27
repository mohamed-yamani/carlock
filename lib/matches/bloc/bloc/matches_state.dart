part of 'matches_bloc.dart';

abstract class MatchesState extends Equatable {
  const MatchesState();
}

class MatchesInitial extends MatchesState {
  @override
  List<Object> get props => [];
}

class MatchesLoadingState extends MatchesState {
  @override
  List<Object> get props => [];
}

class MatchesLoadedState extends MatchesState {
  final List<MatchModel> matches;
  final String username;

  const MatchesLoadedState(
    this.matches,
    this.username,
  );

  @override
  List<Object?> get props => [
        matches,
        username,
      ];
}
