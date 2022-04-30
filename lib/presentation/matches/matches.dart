import 'package:carlock/presentation/matches/bloc/bloc/matches_bloc.dart';
import 'package:carlock/presentation/matches/nav_bar.dart';
import 'package:carlock/model/matches_model.dart';
import 'package:carlock/services/matches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BlocProvider.value(
        value: MatchesBloc(MatchesServices()),
        child: const NavBar(),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
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
              ..add(const LoadMatchesEvent('')),
        child: BlocBuilder<MatchesBloc, MatchesState>(
          builder: (context, state) {
            if (state is MatchesLoadingState) {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColorLight,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ));
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
                    textAlign: TextAlign.center,
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
                            'https://i.pinimg.com/originals/f0/0c/f0/f00cf06bbb48a178c56f1269c038cdf6.jpg',
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
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/map_page',
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                          'https://img.phonandroid.com/2016/04/comment-utiliser-google-maps-gps.jpg',
                        ),
                        radius: 25,
                      ),
                      // child: Container(
                      //   width: 40,
                      //   height: 40,
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(50)),
                      //   child: Center(
                      //     child: Icon(
                      //       Icons.location_on_outlined,
                      //       color: Theme.of(context).primaryColor,
                      //       size: 30,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
