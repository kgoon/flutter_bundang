import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  User _user;
  String _errorMsg = '';

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
      jsonData = json.decode(authResult.body);
      setErrorMsg(jsonData["message"]);
      return false;
    } catch (e) {
      setErrorMsg('서버가 응답하지 않습니다');
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
      jsonData = json.decode(authResult.body);
      setErrorMsg(jsonData["message"]);
      return false;
    } catch (e) {
      setErrorMsg('서버가 응답하지 않습니다');
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

  // 서버로 부터 수신한 메세지 설정
  setErrorMsg(String msg) {
    if (msg.contains('information')) {
      msg = '가입된 이메일이 아닙니다';
    } else if (msg.contains('password')) {
      msg = '패스워드가 잘못 되었습니다';
    } else if (msg.contains('Already')) {
      msg = '이미 가입된 이메일 입니다';
    }
    _errorMsg = msg;
  }

  // 서버로 부터 수신한 메세지 반환하고 삭제
  getErrorMsg() {
    String msg = _errorMsg;
    _errorMsg = null;
    return msg;
  }
}
