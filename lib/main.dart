import 'package:carlock/about/about_page.dart';
import 'package:carlock/home/home.dart';
import 'package:carlock/matches/matches.dart';
import 'package:carlock/model/match.dart';
import 'package:carlock/model/token.dart';
import 'package:carlock/profile/profile_page.dart';
import 'package:carlock/repository/save_get_token.dart';
import 'package:carlock/services/authentication.dart';
import 'package:carlock/services/matches.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:print_color/print_color.dart';

Future<void> main() async {
  bool isLoggedIn = true;
  await Hive.initFlutter(); //!hive init
  Hive.registerAdapter(TokenModelAdapter()); //!hive register adapter
  if (await getToken() == null) {
    isLoggedIn = false;
  } else {
    isLoggedIn = true;
  }
  try {
    await getToken();
  } catch (e) {
    isLoggedIn = false;
  }
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  late bool? isLoggedIn;
  MyApp({this.isLoggedIn});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationService>(
          create: (context) => AuthenticationService(),
        ),
        RepositoryProvider<MatchesServices>(
          create: (context) => MatchesServices(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColorLight: Colors.white,
          primaryColorDark: Colors.black,
          primarySwatch: Colors.deepOrange,
          fontFamily: 'Georgia',
        ),
        // home: HomePage(),
        home: (isLoggedIn == false) ? HomePage() : MatchesPage(),
        routes: {
          '/matches': (context) => const MatchesPage(),
          '/home': (context) => HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/about': (context) => const AboutPage(),
          '/contact': (context) => const AboutPage(),
        },
      ),
    );
  }
}
