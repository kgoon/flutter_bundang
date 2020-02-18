import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String uid;
  User({this.uid});
}

abstract class AuthBase {
  Future<User> createUserWithEmail(String email, String password,
      {String birthday});
  Future<User> signInWithEmail(String email, String password);
  Future<void> signOut();
}

class AuthFromFireBase implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_fromFirebase);
  }

  User _fromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Future<User> createUserWithEmail(String email, String password,
      {String birthday}) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _fromFirebase(authResult.user);
  }

  @override
  Future<User> signInWithEmail(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _fromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

class AuthFromCustom implements AuthBase {
  @override
  Future<User> createUserWithEmail(String email, String password,
      {String birthday}) async {
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
      print(_fromCustom(jsonData['token']).uid);
    } else {
      throw ("some arbitrary error");
    }
    return _fromCustom(jsonData['token']);
  }

  @override
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
      print(_fromCustom(jsonData['token']).uid);
    } else {
      throw ("some arbitrary error");
    }
    return _fromCustom(jsonData['token']);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    return null;
  }

  User _fromCustom(String token) {
    if (token == null) {
      return null;
    }
    return User(uid: token);
  }

  Stream<User> get onAuthStateChanged {
    return null;
  }
}
