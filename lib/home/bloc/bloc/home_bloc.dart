import 'package:bloc/bloc.dart';
import 'package:carlock/services/authentication.dart';
import 'package:carlock/services/matches.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationService _auth;
  final MatchesServices _matchesService;

  HomeBloc(this._auth, this._matchesService)
      : super(RegisteringServiceState()) {
    on<LoginEvent>((event, emitter) async {
      final user = await _auth.authenticate(event.username, event.password);
      if (user != null) {
        emit(SuccessfulLoginState(user));
        emit(HomeInitial());
      } else {
        
      }
    });

    on<RegisteringServiceEvent>((event, emitter) async {
      await _auth.init();
      await _matchesService.init();
      emit(const HomeInitial());
    });
  }
}
