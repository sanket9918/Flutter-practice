import 'package:brew_sanket/models/user.dart';
import 'package:brew_sanket/services/database.dart';
import 'package:brew_sanket/shared/constants.dart';
import 'package:brew_sanket/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName = "";
  String _currentSugars = '0';
  int _currentStrength = 100;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserMain?>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Update your brew settings",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "Name"),
                    validator: (val) => val!.isEmpty ? "Enter a name" : null,
                    onChanged: (val) {
                      setState(() {
                        _currentName = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // dropdown
                  DropdownButtonFormField(
                      value: userData?.sugars ?? _currentSugars,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar sugars'),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _currentSugars = val as String;
                        });
                      }),
                  // slider
                  Slider(
                      min: 100,
                      max: 900,
                      divisions: 8,
                      value:
                          (userData?.strength ?? _currentStrength).toDouble(),
                      activeColor:
                          Colors.purple[userData?.strength ?? _currentStrength],
                      inactiveColor:
                          Colors.purple[userData?.strength ?? _currentStrength],
                      onChanged: (val) => setState(() {
                            _currentStrength = val.round();
                          })),
                  // button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[400],
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print(userData);
                      print(_currentName);
                      print(_currentStrength);
                      print(_currentSugars);
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
