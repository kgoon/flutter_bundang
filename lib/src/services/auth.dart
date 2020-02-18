import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class User {
  final String uid;
  User({this.uid});
}

abstract class AuthBase {
  Future<User> createUserWithEmail(String email, String password,
      {String birthday});
  Future<User> signInWithEmail(String email, String password);
  Future<void> signOut();
}

class AuthFromFireBase implements AuthBase {
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

  @override
  Future<User> createUserWithEmail(String email, String password,
      {String birthday}) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _fromFirebase(authResult.user);
  }

  @override
  Future<User> signInWithEmail(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _fromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

class AuthFromCustom implements AuthBase {
  @override
  Future<User> createUserWithEmail(String email, String password,
      {String birthday}) {
    // TODO: implement createUserWithEmail
    return null;
  }

  @override
  Future<User> signInWithEmail(String email, String password) {
    // TODO: implement signInWithEmail
    return null;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    return null;
  }
}
