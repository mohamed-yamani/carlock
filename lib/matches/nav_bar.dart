import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'carlock',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
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
            leading: const Icon(Icons.group),
            title: const Text('Liste des utilisateurs'),
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
            leading: const Icon(Icons.person),
            title: const Text('Mon profil'),
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
            leading: const Icon(Icons.info),
            title: const Text('A propos'),
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
            leading: const Icon(Icons.phone),
            title: const Text('Contact'),
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
        ],
      ),
    );
  }
}
