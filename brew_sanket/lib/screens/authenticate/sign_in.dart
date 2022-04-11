import 'package:brew_sanket/services/auth.dart';
import 'package:brew_sanket/shared/constants.dart';
import 'package:brew_sanket/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.purple[100],
            appBar: AppBar(
              backgroundColor: Colors.purple[900],
              elevation: 0.0,
              title: const Text("Sign in to the app"),
              actions: [
                TextButton.icon(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    widget.toggleView();
                  },
                  label: const Text("Register"),
                )
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: "Email"),
                      validator: (val) =>
                          val!.isEmpty ? "Enter an email" : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: "Password"),
                      validator: (val) => val!.length < 6
                          ? "Enter an password greater than 6 characters"
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink[400],
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = "Couldn't sign in with given credentials";
                            });
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
              // child: ElevatedButton(
              //   child: const Text("Sign in as Guest"),
              //   onPressed: () async {
              //     dynamic result = await _auth.signInAnonymous();
              //     if (result == null) {
              //       print("Error signini in");
              //     } else {
              //       print("Sign in success");
              //       print(result.uid);
              //     }
              //   },
              // ),
            ),
          );
  }
}
