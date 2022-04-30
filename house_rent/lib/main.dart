import 'package:flutter/material.dart';
import 'package:house_rent/screens/home/home.dart';

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
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
              background: const Color(0xFFF5F6F6),
              primary: const Color(0xFF811B83),
              secondary: const Color(0xFFFA5019)),
          textTheme: theme.textTheme.copyWith(
              headline1: const TextStyle(color: Color(0xFF100E34)),
              bodyText1:
                  TextStyle(color: const Color(0xFF100E34).withOpacity(0.5))),
        ),
        home: HomePage());
  }
}
