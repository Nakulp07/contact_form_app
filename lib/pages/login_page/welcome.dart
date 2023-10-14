import 'package:contac_form_app/auth/initial_auth_service.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
          ),
          Text(
            'Welcome !!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Decide(),
          ),
        ],
      ),
    );
  }
}
