import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/screens/home/home.dart';
import 'package:food_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage());
  }
}
