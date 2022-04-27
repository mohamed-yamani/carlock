import 'package:carlock/matches/bloc/bloc/matches_bloc.dart';
import 'package:carlock/services/matches.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({Key? key, @required this.username}) : super(key: key);

  final String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'HISTORIQUE DES MATCHES',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            MatchesBloc(RepositoryProvider.of<MatchesServices>(context))
              ..add(LoadMatchesEvent(username ?? '')),
        child: BlocBuilder<MatchesBloc, MatchesState>(
          builder: (context, state) {
            if (state is MatchesLoadedState) {
              return ListView(children: [
                ...state.matches.map((task) {
                  return ListTile(
                    title: Text(task.date),
                    subtitle: Text(task.user),
                  );
                }).toList(),
              ]);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
