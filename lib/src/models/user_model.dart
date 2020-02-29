import 'package:flutter/foundation.dart';

class User {
  final String userToken;
  final String userName;
  final String userEmail;
  final String userImageUrl;
  User({
    @required this.userToken,
    @required this.userEmail,
    this.userName = '',
    this.userImageUrl = '',
  });

  User copyWith({
    String userName,
    String userImageUrl,
  }) {
    return User(
      userToken: this.userToken,
      userEmail: this.userEmail,
      userName: userName ?? this.userName,
      userImageUrl: userImageUrl ?? this.userImageUrl,
    );
  }
}
