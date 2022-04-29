import 'package:bloc/bloc.dart';
import 'package:carlock/model/matches_model.dart';
import 'package:carlock/repository/matches_repository.dart';
import 'package:carlock/services/matches.dart';
import 'package:equatable/equatable.dart';
part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final MatchesServices _todoService;
  final repo = MatchesRepository();

  MatchesBloc(this._todoService) : super(MatchesInitial()) {
    @override
    Stream<MatchesState> mapEventToState(MatchesEvent event) async* {
      if (event is LoadMatchesEvent) {
        yield MatchesLoadingState();
        try {
          // ? from the Services
          MatchesModel matches = await _todoService.getAll(event.username);
          // ! from the Repository
          // MatchesModel matches = await repo.getMathesFromWe();
          yield MatchesLoadedState(matches);
        } catch (e) {
          yield MatchesErrorState(e.toString());
        }
      }
    }

    // ! old code
    on<LoadMatchesEvent>((event, emit) async {
      MatchesModel matches = await _todoService.getAll(event.username);
      emit(MatchesLoadedState(matches));
      try {
        // ? from the Services
        // MatchesModel matches = await _todoService.getAll(event.username);
        // ! from the Repository
        // MatchesModel matches = await repo.getMathesFromWe();
        emit(MatchesLoadedState(matches));
      } catch (e) {
        emit(MatchesErrorState(e.toString()));
      }
    });
  }
}
