import 'dart:convert';

import 'package:flutter_bundang/src/models/user_model.dart';
import 'package:flutter_bundang/src/services/auth_service.dart';
import 'package:flutter_bundang/src/services/database_service.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiBloc {
  final _auth = AuthService.fromSingleton();
  final _database = DatabaseService.fromSingleton();
  final _userSubject = BehaviorSubject<User>();
  User _user;

  // Getters
  Stream<User> get userSubject => _userSubject.stream;

  // Setters
  Function(User) get changeUser => _userSubject.sink.add;

  // initialize user
  User _fromUserTokenEmail(String token, String email) {
    return User(userToken: token, userEmail: email);
  }

  // Update User_model
  void _updateUser({String userName, String userImgUrl}) {
    _user = _user.copyWith(
      userName: userName,
      userImageUrl: userImgUrl,
    );
    changeUser(_user);
  }

  // Business Logic with shared_preferences
  Future<void> savePreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<void> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    String email = prefs.getString('email');
    if (token != null) {
      _user = _fromUserTokenEmail(token, email);
      changeUser(_user);
    } else {
      changeUser(null);
    }
  }

  Future<void> deletePreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // Business Logic with auth_service
  Future<bool> createUserWithEmail(
      {String email, String password, String birthday}) async {
    try {
      Map<String, dynamic> jsonData = {};
      final authResult = await _auth.createUserWithEmail(
        email: email,
        password: password,
        birthday: birthday,
      );
      if (authResult.statusCode == 200) {
        jsonData = json.decode(authResult.body);
        savePreferences('token', jsonData['token']);
        savePreferences('email', jsonData['email']);
        _user = _fromUserTokenEmail(jsonData['token'], jsonData['email']);
        changeUser(_user);
        return true;
      }
      jsonData = json.decode(authResult.body);
      // setErrorMsg(jsonData["message"]);
      return false;
    } catch (e) {
      // setErrorMsg('서버가 응답하지 않습니다');
      print(e);
      return false;
    }
  }

  Future<bool> signInWithEmail({String email, String password}) async {
    try {
      Map<String, dynamic> jsonData = {};
      final authResult =
          await _auth.signInWithEmail(email: email, password: password);
      if (authResult.statusCode == 200) {
        jsonData = json.decode(authResult.body);
        savePreferences('token', jsonData['token']);
        savePreferences('email', jsonData['email']);
        _user = _fromUserTokenEmail(
          jsonData['token'],
          jsonData['email'],
        );
        changeUser(_user);
        return true;
      }
      jsonData = json.decode(authResult.body);
      // setErrorMsg(jsonData["message"]);
      return false;
    } catch (e) {
      // setErrorMsg('서버가 응답하지 않습니다');
      print(e);
      return false;
    }
  }

  Future<void> signOut() async {
    deletePreferences('token');
    deletePreferences('email');
    changeUser(null);
  }

  // TODO: Business Logic with database_service

  void dispose() {
    _userSubject.close();
  }
}
