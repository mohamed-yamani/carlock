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
  final MatchesModel matches;

  const MatchesLoadedState(
    this.matches,
  );

  @override
  List<Object?> get props => [
        matches,
      ];
}

class MatchesErrorState extends MatchesState {
  final String error;

  const MatchesErrorState(this.error);

  @override
  List<Object?> get props => [
        error,
      ];
}
