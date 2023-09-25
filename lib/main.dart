import 'package:contac_form_app/routes/route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Here firebase app will be initialized
  runApp(const FormApp());
}

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // to remove debug banner
      routerConfig: FormAppRouter().router, // go_router for the app
    );
  }
}
