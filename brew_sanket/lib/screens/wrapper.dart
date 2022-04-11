import 'package:brew_sanket/models/user.dart';
import 'package:brew_sanket/screens/authenticate/authenticate.dart';
import 'package:brew_sanket/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserMain?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
