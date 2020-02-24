import 'package:flutter/material.dart';

class SignInModel with ChangeNotifier {
  String email;
  String password;

  SignInModel({
    this.email,
    this.password,
  });

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;

    notifyListeners();
  }
}
