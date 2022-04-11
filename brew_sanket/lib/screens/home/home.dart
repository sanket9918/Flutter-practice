import 'package:brew_sanket/models/brew.dart';
import 'package:brew_sanket/screens/home/brew_list.dart';
import 'package:brew_sanket/services/auth.dart';
import 'package:brew_sanket/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew?>?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          title: const Text("Brew Sanket"),
          backgroundColor: Colors.purple[900],
          elevation: 0.0,
          actions: [
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: const BrewList(),
      ),
    );
  }
}
