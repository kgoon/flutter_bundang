import 'package:flutter/material.dart';

class SignUpModel with ChangeNotifier {
  String email;
  String password;
  String rePassword;
  String birthday;
  bool isChecked;

  SignUpModel({
    this.email,
    this.password,
    this.rePassword,
    this.birthday,
    this.isChecked = false,
  });

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);
  void updateRePassword(String rePassword) =>
      updateWith(rePassword: rePassword);
  void updateBirthday(String birthday) => updateWith(birthday: birthday);

  void updateWith(
      {String email,
      String password,
      String rePassword,
      String birthday,
      bool isChecked}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.rePassword = rePassword ?? this.rePassword;
    this.birthday = birthday ?? this.birthday;
    this.isChecked = isChecked ?? this.isChecked;

    notifyListeners();
  }

  void changeCheckBoxValue(bool value) {
    updateWith(isChecked: value);
  }
}
