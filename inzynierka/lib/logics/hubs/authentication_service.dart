import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _fireBaseAuth;
  AuthenticationService(this._fireBaseAuth);

  Stream<User?> get authStateChanges => _fireBaseAuth.authStateChanges();

  Future signIn(String email, String password) async {
    _fireBaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future register(String email, String password) async {
    try {
      _fireBaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signOut() async {
    try {
      _fireBaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
