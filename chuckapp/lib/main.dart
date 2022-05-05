import 'package:chuckapp/screen/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              background: const Color(0xFFF5F6F6),
              primary: Color.fromARGB(255, 59, 0, 28),
              secondary: const Color(0xFFFA5019)),
          textTheme: theme.textTheme.copyWith(
              headline1: const TextStyle(color: Color(0xFF100E34)),
              bodyText1:
                  TextStyle(color: const Color(0xFF100E34).withOpacity(0.5))),
        ),
        home: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: HomePage(),
        ));
  }
}
