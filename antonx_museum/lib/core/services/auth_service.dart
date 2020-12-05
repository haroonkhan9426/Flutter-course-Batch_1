import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<bool> loginWithEmailAndPassword(email, pass) async {
    try {
      final userCredentials =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      if (userCredentials.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Login failed with Reason: $e');
      return false;
    }
  }

  Future<bool> createAccountWithEmail(email, pass) async {
    try {
      final userCredentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (userCredentials.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Account create failed with Reason: $e');
      return false;
    }
  }

  bool isLogin() {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  logout() async {
    await _auth.signOut();
  }
}
