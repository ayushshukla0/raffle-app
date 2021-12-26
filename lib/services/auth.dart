import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  int userStatus() {
    int status = -1; // 0 for logged out, 1 for logged in, -1 for error

    _firebaseAuth.userChanges().listen((User? user) {
      if (user == null) {
        status = 0;
      } else {
        status = 1;
      }
    });

    return status;
  }

  Future<int> createAccount(String email, String password) async {
    int status = 0; // 0 for success, 1 for weak password, 2 for email in use

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        status = 1;
      } else if (e.code == 'email-already-in-use') {
        status = 2;
      }
    } catch (e) {
      print(e);
    }

    return status;
  }

  Future<int> signIn(String email, String password) async {
    int status = 0; // 0 for success, 1 for user not found, 2 for wrong password

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        status = 1;
      } else if (e.code == 'wrong-password') {
        status = 2;
      }
    }

    return status;
  }
}
