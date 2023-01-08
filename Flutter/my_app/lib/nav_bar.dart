import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {Navigator.pushNamed(context, '/')},
          ),
          ListTile(
            leading: const Icon(Icons.supervisor_account),
            title: const Text('Professions'),
            onTap: () => {Navigator.pushNamed(context, '/profession')},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Training'),
            onTap: () => {Navigator.pushNamed(context, '/training')},
          ),
        ],
      ),
    );
  }
}
