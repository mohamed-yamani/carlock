import 'package:carlock/model/match.dart';
import 'package:carlock/repository/matches_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MatchesServices {
  late Box<MatchModel> _matchBox;

  Future<void> init() async {
    Hive.registerAdapter(MatchModelAdapter());
    _matchBox = await Hive.openBox('matches');

    await _matchBox.clear();

    await _matchBox
        .add(MatchModel('testuser1', '1337 future is loading', '2020-01-01'));
    await _matchBox
        .add(MatchModel('testuser2', '42 born to code', '2018-01-02'));
  }

  List<MatchModel> getAll(final String username) {
    Future<List> matchesList = AuthRepository().getMathesFromWe();
    return [
      MatchModel('testuser1', '1337 future is loading', '2020-01-01'),
      MatchModel('testuser2', '42 born to code', '2018-01-02'),
      MatchModel(username, 'I am a match', '2020-01-01'),
    ];
  }

  void addMatch(final String car, final MatchModel match) async {
    _matchBox.add(MatchModel(car, match.user, match.date));
  }

  void removeMatch(final String username, final MatchModel match) async {
    final matchToRemove = _matchBox.values.firstWhere((element) =>
        element.user == username &&
        element.car == match.car &&
        element.date == match.date);
    await matchToRemove.delete();
  }

  Future<void> updateMatch(
      final String username, final MatchModel match) async {
    final matchToUpdate = _matchBox.values.firstWhere((element) =>
        element.user == username &&
        element.car == match.car &&
        element.date == match.date);
  }
}
