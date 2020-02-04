import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;

  User({this.uid});
}

class Auth {
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

  Future<User> createUserWithEmail(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _fromFirebase(authResult.user);
  }

  Future<User> signInWithEmail(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _fromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
