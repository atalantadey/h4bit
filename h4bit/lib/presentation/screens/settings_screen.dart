import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (bool value) {
                // TODO: Implement theme switching
              },
            ),
          ),
          ListTile(
            title: const Text('Notifications'),
            trailing: Switch(
              value: true, // TODO: Implement notification settings
              onChanged: (bool value) {
                // TODO: Implement notification toggle
              },
            ),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: 'English', // TODO: Implement language settings
              items:
                  <String>['English', 'Spanish', 'French'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                // TODO: Implement language change
              },
            ),
          ),
          ListTile(
            title:const  Text('Logout'),
            onTap: () {
              context.read<AuthProvider>().signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
