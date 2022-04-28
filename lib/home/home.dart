import 'package:carlock/home/bloc/bloc/home_bloc.dart';
import 'package:carlock/matches/bloc/bloc/matches_bloc.dart';
import 'package:carlock/matches/matches.dart';
import 'package:carlock/services/authentication.dart';
import 'package:carlock/services/matches.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(
          RepositoryProvider.of<AuthenticationService>(context),
          RepositoryProvider.of<MatchesServices>(context),
        )..add(RegisteringServiceEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is SuccessfulLoginState) {
              Navigator.pushReplacementNamed(context, '/matches',
                  arguments: state.username);
            }
          },
          builder: (context, state) {
            if (state is HomeInitial) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        height: 200,
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Username',
                        ),
                        controller: userNameController,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.security),
                          hintText: 'mot de passe',
                        ),
                        controller: passwordController,
                      ),
                      ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          BlocProvider.of<HomeBloc>(context).add(
                            LoginEvent(
                              userNameController.text,
                              passwordController.text,
                            ),
                          );
                          // Navigator.pushReplacementNamed(context, '/home');
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
