import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/screens/home/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/dish3.png',
                fit: BoxFit.cover,
                height: 250,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Food UI App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
