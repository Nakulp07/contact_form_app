import 'package:contac_form_app/pages/auth/initial_auth_service.dart';
import 'package:contac_form_app/routes/route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

const appScheme = 'flutterdemo';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Here firebase app will be initialized
  setup();
  runApp(const FormApp());
}

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State<FormApp> createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // to remove debug banner
      routerConfig: FormAppRouter().router, // go_router for the app
    );
  }
}
