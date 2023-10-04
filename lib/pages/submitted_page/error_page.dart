import 'package:flutter/material.dart';

class ErrorClass extends StatefulWidget {
  const ErrorClass({super.key});

  @override
  State<ErrorClass> createState() => _ErrorClassState();
}

class _ErrorClassState extends State<ErrorClass> {
  // simple error page if error occurs while routing
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Something went wrong !!'),
      ),
    );
  }
}
