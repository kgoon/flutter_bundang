import 'dart:convert';
import 'dart:io';
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
  User get user => _user;

  // Setters
  Function(User) get changeUser => _userSubject.sink.add;

  // initialize user
  User _fromUserApi(String token, String email, String name, String imgUrl) {
    return User(
        userToken: token,
        userEmail: email,
        userName: name,
        userImageUrl: imgUrl);
  }

  // Update User_model
  void _updateUserName({String userName}) {
    _user = _user.copyWith(
      userName: userName,
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
    String name = prefs.getString('name');
    String url = prefs.getString('url');
    if (token != null) {
      _user = _fromUserApi(token, email, name, url);
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
        savePreferences('url',
            'https://flutter-study-api.appspot.com/api/file/avatar/${jsonData['userId']}');
        _user = _fromUserApi(
            jsonData['token'],
            jsonData['email'],
            jsonData['userName'],
            'https://flutter-study-api.appspot.com/api/file/avatar/${jsonData['userId']}');
        changeUser(_user);
        return true;
      }
      jsonData = json.decode(authResult.body);
      print(jsonData['message']);
      // setErrorMsg(jsonData["message"]);
      return false;
    } catch (e) {
      // setErrorMsg('서버가 응답하지 않습니다');
      print(e.message);
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
        savePreferences('name', jsonData['userName']);
        savePreferences('url',
            'https://flutter-study-api.appspot.com/api/file/avatar/${jsonData['userId']}');
        _user = _fromUserApi(
            jsonData['token'],
            jsonData['email'],
            jsonData['userName'],
            'https://flutter-study-api.appspot.com/api/file/avatar/${jsonData['userId']}');
        changeUser(_user);
        return true;
      }
      jsonData = json.decode(authResult.body);
      print(jsonData['message']);
      // setErrorMsg(jsonData["message"]);
      return false;
    } catch (e) {
      print(e.message);
      // setErrorMsg('서버가 응답하지 않습니다');
      // print(e);
      return false;
    }
  }

  Future<void> signOut() async {
    deletePreferences('token');
    deletePreferences('email');
    deletePreferences('name');
    deletePreferences('url');
    changeUser(null);
  }

  // Business Logic with database_service
  Future<bool> checkUserName({String name}) async {
    try {
      Map<String, dynamic> jsonData = {};
      final databaseResult = await _database.checkUserName(
        name: name,
      );
      if (databaseResult.statusCode == 200) {
        jsonData = json.decode(databaseResult.body);
        if (jsonData['result'] == false) {
          return true;
        }
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> setUserName({
    String name,
  }) async {
    try {
      Map<String, dynamic> jsonData = {};
      final databaseResult = await _database.setUserName(
        token: _user.userToken,
        name: name,
      );
      if (databaseResult.statusCode == 200) {
        savePreferences('name', name);
        _updateUserName(userName: name);
        return true;
      }
      jsonData = json.decode(databaseResult.body);
      print(jsonData["message"]);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future setProfileImage({
    String filePath,
    File image,
  }) async {
    if (filePath.isNotEmpty) {
      try {
        final databaseResult = await _database.setProfileImage(
            token: _user.userToken, filePath: filePath, image: image);
        if (databaseResult.statusCode == 200) {
          databaseResult.stream.transform(utf8.decoder).listen((value) {
            print(value);
          });
          return true;
        }
        databaseResult.stream.transform(utf8.decoder).listen((value) {
          print(value);
        });
        return false;
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      print('not selected image');
    }
  }

  void dispose() {
    _userSubject.close();
  }
}
