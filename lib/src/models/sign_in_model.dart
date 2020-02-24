import 'package:flutter/material.dart';

class SignInModel with ChangeNotifier {
  String email;
  String password;
  bool autoVal;

  SignInModel({
    this.email,
    this.password,
    this.autoVal = false,
  });

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String email,
    String password,
    bool autoVal,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.autoVal = autoVal ?? this.autoVal;

    notifyListeners();
  }

  void changeAutoVal(bool value) {
    updateWith(autoVal: value);
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return '이메일 란을 입력해 주세요';
    } else if (!value.contains('@')) {
      return '올바른 이메일 형식을 적어주세요';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'password를 입력해주세요';
    } else if (value.length < 6) {
      return '비밀번호는 최소 6자 이상 입력해 주세요';
    }
    return null;
  }
}
