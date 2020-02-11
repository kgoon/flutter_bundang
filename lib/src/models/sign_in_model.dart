import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/services/auth.dart';

class SignInModel with ChangeNotifier {
  final Auth auth;
  String email;
  String password;

  SignInModel({
    @required this.auth,
    this.email = '',
    this.password = '',
  });

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({String email, String password}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    notifyListeners();
  }

  Future<void> submit() async {
    try {
      await auth.createUserWithEmail(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login() async {
    try {
      await auth.signInWithEmail(email, password);
    } catch (e) {
      rethrow;
    }
  }
}
