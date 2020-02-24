import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:flutter_bundang/src/widgets/validators.dart';

class SignInModel with ChangeNotifier, UserValidators {
  final AuthBase auth;
  String email;
  String password;
  String birthday;
  bool isChecked;

  SignInModel({
    @required this.auth,
    this.email = '',
    this.password = '',
    this.birthday = '',
    this.isChecked = false,
  });

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);
  void updateBirthday(String birthday) => updateWith(birthday: birthday);

  void updateWith(
      {String email, String password, String birthday, bool isChecked}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.birthday = birthday ?? this.birthday;
    this.isChecked = isChecked ?? this.isChecked;

    notifyListeners();
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
