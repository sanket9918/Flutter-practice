import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql/util/config.dart';
import 'package:flutter_graphql/widgets/custom_buttom.dart';
import 'package:flutter_graphql/widgets/toastUtil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String token = "";
  bool viewBusyState = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Registera App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailAddressController,
                      decoration: const InputDecoration(labelText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        RegExp regex = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                        if (!regex.hasMatch(val!)) {
                          return 'Enter Valid Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: "Password"),
                      validator: (val) {
                        return val!.length < 4
                            ? "Password must be at least 4 characters long"
                            : null;
                      },
                      obscureText: true,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  CustomButton(
                    width: 180,
                    height: 50,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          viewBusyState = true;
                        });
                        try {
                          Response response = await Dio()
                              .post("http://10.0.2.2:5000/login", data: {
                            "email": _emailAddressController.text,
                            "password": _passwordController.text
                          }).onError((error, stackTrace) =>
                                  UtilFs.showToast("Login Failed", context));

                          if (response.statusCode == 200) {
                            const storage = FlutterSecureStorage();
                            await storage.write(
                                key: 'jwt', value: response.data['token']);

                            await Config.loginPref(response.data['token']);
                            Config.retrieveAuthPref();

                            Navigator.pushReplacementNamed(context, '/dashboard');
                          } else {
                            UtilFs.showToast("Login Failed", context);
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        } catch (err) {
                          setState(() {
                            viewBusyState = false;
                          });
                          UtilFs.showToast("Login Failed", context);
                          FocusManager.instance.primaryFocus?.unfocus();
                        }
                      }
                    },
                    text: "Login",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        debugPrint("Signup to be added");
                      },
                      child: const SizedBox(
                        height: 20,
                        child: Text(
                          "New? Sign Up",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
