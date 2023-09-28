import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          child: Text(
            'Contact Form App',
            style: headlineTextStyle,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: null,
          child: Text('Login'),
        ),
      ]),
    );
  }
}
