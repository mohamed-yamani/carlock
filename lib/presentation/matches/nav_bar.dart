import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carlock/presentation/matches/bloc/bloc/matches_bloc.dart';
import 'package:carlock/repository/save_get_token.dart';
import 'package:carlock/services/matches.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MatchesBloc(RepositoryProvider.of<MatchesServices>(context))
            ..add(const LoadMatchesEvent('')),
      child: Drawer(
        backgroundColor: Colors.black.withOpacity(0.5),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            BlocBuilder<MatchesBloc, MatchesState>(builder: (context, state) {
              if (state is MatchesLoadingState) {
                return onLoading(context);
              }

              if (state is MatchesLoadedState) {
                return drawerHeader(context, state);
              }
              if (state is MatchesErrorState) {
                return const Text('Error');
              }
              return const Text('Unknown');
            }),
            ListTile(
              leading: Icon(Icons.group, color: Theme.of(context).primaryColor),
              title: Text('Liste des utilisateurs',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColorLight)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/users');
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            ListTile(
              leading:
                  Icon(Icons.person, color: Theme.of(context).primaryColor),
              title: Text('Mon profil',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColorLight)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            ListTile(
              leading: Icon(Icons.info, color: Theme.of(context).primaryColor),
              title: Text('A propos',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColorLight)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/about');
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Theme.of(context).primaryColor),
              title: Text('Contact',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColorLight)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/contact');
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.38,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,
                  size: 30, color: Theme.of(context).primaryColor),
              title: Text('Déconnexion',
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor)),
              onTap: () async {
                await deleteToken();
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/home');
              },
            ),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader onLoading(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: const Text(
        'carlock',
        style: TextStyle(color: Colors.transparent, fontSize: 20),
      ),
      arrowColor: Colors.black,
      accountEmail: const Text('.'),
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.network(
            'https://media.istockphoto.com/photos/portrait-of-a-man-using-a-computer-in-a-modern-office-picture-id1344688156?b=1&k=20&m=1344688156&s=170667a&w=0&h=GWBMc5h9yv3gIKjvlbcfpz9UgdvCDM2i3kyNoZKL8UY=',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/sidebar.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  UserAccountsDrawerHeader drawerHeader(BuildContext context, state) {
    return UserAccountsDrawerHeader(
      accountName: const Text(
        'carlock',
        style: TextStyle(color: Colors.transparent, fontSize: 20),
      ),
      arrowColor: Colors.black,
      accountEmail: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(
            'Hello ${state.user.user}',
            textStyle: TextStyle(
                fontSize: 18, color: Theme.of(context).primaryColorLight),
          ),
          WavyAnimatedText('Look at Mercedes-AMG',
              textStyle: TextStyle(
                  fontSize: 17, color: Theme.of(context).primaryColor)),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.network(
            'https://i.pinimg.com/originals/f0/0c/f0/f00cf06bbb48a178c56f1269c038cdf6.jpg',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/sidebar.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
