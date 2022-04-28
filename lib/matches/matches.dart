import 'package:carlock/matches/bloc/bloc/matches_bloc.dart';
import 'package:carlock/matches/nav_bar.dart';
import 'package:carlock/model/matches_model.dart';
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
      drawer: const NavBar(),
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
            if (state is MatchesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MatchesLoadedState) {
              return ListView(children: [
                ...state.matches.results!.map((result) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, top: 2),
                    child: _getCard(result),
                  );
                }).toList(),
              ]);
            }
            if (state is MatchesErrorState) {
              return Center(
                child: Text(state.error,
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).errorColor)),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class _getCard extends StatelessWidget {
  late Results result;
  _getCard(this.result);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey[200],
        child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.access_time_outlined,
                      size: 25,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '15 avril 2020, a 16h00',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Image(
                    image: NetworkImage(result.picture ??
                        'https://us.123rf.com/450wm/infadel/infadel1712/infadel171200119/91684826-a-black-linear-photo-camera-logo-like-no-image-available-.jpg'),
                    width: double.infinity,
                    fit: BoxFit.cover),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                            'https://www.ssc.edu/wp-content/uploads/2014/08/silhouette-man.jpg',
                          ),
                          radius: 25,
                        ),
                      ],
                    ),
                    Text(
                      '${result.matriculeStr}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
