class User {
  final String userToken;
  User({this.userToken});

  @override
  String toString() {
    return 'token: $userToken';
  }
}
