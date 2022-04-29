import 'package:carlock/model/match.dart';
import 'package:carlock/model/matches_model.dart';
import 'package:carlock/repository/matches_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MatchesServices {
  late Box<MatchModel> _matchBox;

  Future<void> init() async {
    try {
      Hive.registerAdapter(MatchModelAdapter());
    } catch (e) {
      print(e.toString());
    }
    _matchBox = await Hive.openBox('matches');

    await _matchBox.clear();
    // await _matchBox
    //     .add(MatchModel('testuser1', '1337 future is loading', '2020-01-01'));
    // await _matchBox
    //     .add(MatchModel('testuser2', '42 born to code', '2018-01-02'));
  }

  Future<MatchesModel> getAll(final String username) {
    Future<MatchesModel> matches = MatchesRepository().getMathesFromWe();

    // return matches;
    try {
      return matches;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
