import 'package:flutter/material.dart';

class SignUpModel with ChangeNotifier {
  String email;
  String password;
  String rePassword;
  String birthday;
  bool isChecked;
  bool autoVal;

  SignUpModel({
    this.email,
    this.password,
    this.rePassword,
    this.birthday,
    this.isChecked = false,
    this.autoVal = false,
  });

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);
  void updateRePassword(String rePassword) =>
      updateWith(rePassword: rePassword);
  void updateBirthday(String birthday) => updateWith(birthday: birthday);

  void updateWith({
    String email,
    String password,
    String rePassword,
    String birthday,
    bool isChecked,
    bool autoVal,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.rePassword = rePassword ?? this.rePassword;
    this.birthday = birthday ?? this.birthday;
    this.isChecked = isChecked ?? this.isChecked;
    this.autoVal = autoVal ?? this.autoVal;

    notifyListeners();
  }

  void changeCheckBoxValue(bool value) {
    updateWith(isChecked: value);
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

  String validateRePassword(String value) {
    if (value.isEmpty) {
      return 'password를 입력해 주세요';
    } else if (value != password) {
      return '비밀번호가 일치하지 않습니다.';
    }
    return null;
  }

  String validateBirthday(String value) {
    if (birthday == null) {
      return '생일을 선택해 주세요';
    }
    return null;
  }
}
