import 'package:carlock/model/matches_model.dart';
import 'package:carlock/presentation/matches/bloc/bloc/matches_bloc.dart';
import 'package:carlock/services/matches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'CARTE',
          style: TextStyle(
            fontSize: 13,
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
                  color: Colors.black,
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
                    child: Text(result.matriculeStr!),
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
