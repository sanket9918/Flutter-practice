import 'package:brew_sanket/services/auth.dart';
import 'package:brew_sanket/shared/constants.dart';
import 'package:brew_sanket/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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
              title: const Text("Sign Up to the app"),
              actions: [
                TextButton.icon(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    widget.toggleView();
                  },
                  label: const Text("Sign In"),
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
                      validator: (val) =>
                          val!.isEmpty ? "Enter an email" : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Email"),
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
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = "Please give a valid email";
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
