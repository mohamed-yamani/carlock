import 'package:carlock/repository/save_get_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
     
      backgroundColor: Colors.black.withOpacity(0.5),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'carlock',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            arrowColor: Colors.black,
            accountEmail: const Text('myamani@gmail.com'),
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
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1589131318533-47b311b8fd57?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1090&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.group, color: Theme.of(context).primaryColor),
            title: Text('Liste des utilisateurs',
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).primaryColorLight)),
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
            leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
            title: Text('Mon profil',
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).primaryColorLight)),
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
                    fontSize: 18, color: Theme.of(context).primaryColorLight)),
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
                    fontSize: 18, color: Theme.of(context).primaryColorLight)),
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
            height: MediaQuery.of(context).size.height * 0.36,
          ),
          Center(
            child: ListTile(
              leading: Icon(Icons.exit_to_app,
                  color: Theme.of(context).primaryColor),
              title: const Text('Déconnexion',
                  style: TextStyle(fontSize: 18, color: Colors.red)),
              onTap: () async {
                await deleteToken();
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/home');
              },
            ),
          ),
        ],
      ),
    );
  }
}
