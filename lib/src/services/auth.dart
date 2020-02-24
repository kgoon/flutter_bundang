import 'dart:async';

import 'package:flutter_bundang/src/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth {
  Future<User> createUserWithEmail(
      {String email, String password, String birthday}) async {
    Map data = {
      'email': email,
      'password': password,
      'birth': birthday,
    };
    var jsonData = {};
    var response = await http.post(
      'https://flutter-study-api.appspot.com/api/user/register',
      body: data,
    );
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(_fromCustom(jsonData['token']).userToken);
    } else {
      throw ("some arbitrary error");
    }
    return _fromCustom(jsonData['token']);
  }

  Future<User> signInWithEmail(String email, String password) async {
    Map data = {
      'email': email,
      'password': password,
    };
    var jsonData = {};
    var response = await http.post(
      'https://flutter-study-api.appspot.com/api/user/login',
      body: data,
    );
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(_fromCustom(jsonData['token']).userToken);
    } else {
      throw ("some arbitrary error");
    }
    return _fromCustom(jsonData['token']);
  }

  Future<void> signOut() {
    return null;
  }

  User _fromCustom(String token) {
    if (token == null) {
      return null;
    }
    return User(userToken: token);
  }
}
