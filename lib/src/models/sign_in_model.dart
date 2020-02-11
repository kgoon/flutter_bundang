import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:flutter_bundang/src/widgets/validators.dart';

class SignInModel with ChangeNotifier, UserValidators {
  final Auth auth;
  String email;
  String password;
  bool isChecked;

  SignInModel({
    @required this.auth,
    this.email = '',
    this.password = '',
    this.isChecked = false,
  });

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({String email, String password, bool isChecked}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.isChecked = isChecked ?? this.isChecked;
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

  void changeCheckBoxValue(bool value) {
    updateWith(isChecked: value);
  }

  String get emailErrorText {
    if (!emailNotEmpty.isValid(email)) {
      return emailNotEmptyString;
    } else if (!emailFormat.isValid(email)) {
      return emailFormatString;
    } else {
      return null;
    }
  }

  String get passwordErrorText {
    if (!passwordNotEmpty.isValid(password)) {
      return passwordNotEmptyString;
    } else if (!passwordLength.isValid(password)) {
      return passwordLengthString;
    } else {
      return null;
    }
  }
}
