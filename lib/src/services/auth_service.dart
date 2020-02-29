import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthService {
  AuthService._internal();

  factory AuthService.fromSingleton() {
    return _instance;
  }

  static final AuthService _instance = AuthService._internal();

  Future createUserWithEmail({
    @required String email,
    @required String password,
    @required String birthday,
  }) async {
    assert(email != null);
    assert(password != null);
    assert(birthday != null);
    try {
      Map data = {
        'email': email,
        'password': password,
        'birth': birthday,
      };
      final authResult = await http.post(
        'https://flutter-study-api.appspot.com/api/user/register',
        body: data,
      );
      return authResult;
    } catch (e) {
      rethrow;
    }
  }

  Future signInWithEmail({
    @required String email,
    @required String password,
  }) async {
    assert(email != null);
    assert(password != null);
    try {
      Map data = {
        'email': email,
        'password': password,
      };
      final authResult = await http.post(
        'https://flutter-study-api.appspot.com/api/user/login',
        body: data,
      );
      return authResult;
    } catch (e) {
      rethrow;
    }
  }
}
