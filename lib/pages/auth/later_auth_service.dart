import 'dart:convert';
import 'dart:developer';

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'data.dart';

const appScheme = 'app';

class AuthService {
  Credentials? _credentials;
  Auth0 auth0 = Auth0(Data().auth0Domain, Data().clientId);

  FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<AuthState> loginAction() async {
    try {
      final webAuth = auth0.webAuthentication(scheme: appScheme);
      _credentials = await webAuth.login();
      saveData(
        _credentials?.idToken ?? 'null',
        _credentials?.accessToken ?? 'null',
        _credentials?.refreshToken ?? 'null',
      );
      log(' Access token : ${_credentials?.accessToken}');
      log(' Id token : ${_credentials?.idToken}');
      log(' Refresh token : ${_credentials?.refreshToken}');
      log('User has valid credentials');
      return AuthState.signedin;
    } on Exception catch (e) {
      debugPrint('login error: $e');
      return AuthState.notsignedin;
    }
  }

  Future<AuthState> logoutAction() async {
    try {
      await auth0.webAuthentication(scheme: appScheme).logout();
      await _secureStorage.deleteAll();

      _credentials = null;
      log('user logged out successfully');
      return AuthState.notsignedin;
    } on Exception catch (e) {
      log('$e');
      return AuthState.signedin;
    }
  }

  Future<void> saveData(
      String idToken, String accessToken, String refreshToken) async {
    Map<String, String> myData = {
      'idToken': idToken,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
    String jsonKey = jsonEncode(myData);
    await _secureStorage.write(key: 'AuthKeys', value: jsonKey);
  }

  Future<String> readSecureStorage(String key) async {
    return await _secureStorage.read(key: key) ?? "null";
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
