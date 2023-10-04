import 'dart:developer';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../login_page/login.dart';
import '../login_page/profile.dart';
import 'data.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => Auth0AuthenticationService());
}

class Auth0AuthenticationService {
  final Auth0 auth0 = Auth0(Data().auth0Domain, Data().clientId);
  Credentials? credentials;

  Stream<AuthState> get getAuthToken async* {
    final isLoggedIn = await auth0.credentialsManager.hasValidCredentials();
    if (!isLoggedIn) {
      await auth0.credentialsManager.clearCredentials();
      yield AuthState.notsignedin;
      return;
    }

    try {
      credentials = await auth0.credentialsManager.credentials();
      log(' Access token : ${credentials?.accessToken}');
      log(' Id token : ${credentials?.idToken}');
      log(' Refresh token : ${credentials?.refreshToken}');
      log('User has valid credentials');
      yield AuthState.signedin;
    } catch (e) {
      log('Credentials not valid - User not logged in - $e');
      await auth0.credentialsManager.clearCredentials();
      yield AuthState.notsignedin;
      return;
    }
  }
}

class Decide extends StatefulWidget {
  const Decide({super.key});

  @override
  State<Decide> createState() => _DecideState();
}

class _DecideState extends State<Decide> {
  Auth0AuthenticationService auth0service = getIt<Auth0AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth0service.getAuthToken,
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.data == AuthState.signedin) {
          return Profile();
        } else {
          return Login();
        }
      },
    );
  }
}
