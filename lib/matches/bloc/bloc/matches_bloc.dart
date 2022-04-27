import 'package:bloc/bloc.dart';
import 'package:carlock/model/match.dart';
import 'package:carlock/services/matches.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final MatchesServices _todoService;

  MatchesBloc(this._todoService) : super(MatchesInitial()) {
    on<LoadMatchesEvent>((event, emit) {
      final matches = _todoService.getAll(event.username);
      emit(MatchesLoadedState(
        matches,
        event.username,
      ));
    });
  }
}
