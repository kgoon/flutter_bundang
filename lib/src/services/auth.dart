import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  User _user;

  Auth() {
    _currentUser();
  }

  User get user {
    return _user;
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  _currentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) {
      return null;
    } else {
      print(token);
      setUser(_fromCustom(token));
    }
  }

  Future<bool> createUserWithEmail(
      {String email, String password, String birthday}) async {
    try {
      Map data = {
        'email': email,
        'password': password,
        'birth': birthday,
      };
      var jsonData = {};
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final authResult = await http.post(
        'https://flutter-study-api.appspot.com/api/user/register',
        body: data,
      );
      if (authResult.statusCode == 200) {
        jsonData = json.decode(authResult.body);
        prefs.setString('token', jsonData['token']);
        setUser(_fromCustom(jsonData['token']));
        return true;
      }
      return false;
    } on Exception catch (e) {
      e.toString();
      return false;
    }
  }

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      Map data = {
        'email': email,
        'password': password,
      };
      var jsonData = {};
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final authResult = await http.post(
        'https://flutter-study-api.appspot.com/api/user/login',
        body: data,
      );
      if (authResult.statusCode == 200) {
        jsonData = json.decode(authResult.body);
        prefs.setString('token', jsonData['token']);
        setUser(_fromCustom(jsonData['token']));
        return true;
      }
      return false;
    } on Exception catch (e) {
      e.toString();
      return false;
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    setUser(null);
  }

  User _fromCustom(String token) {
    return User(userToken: token);
  }
}
