//to hold the firebase calls/logic that is related to authentication
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String>
      get onAuthStateChanged => //listens to whenever there are changes in logging in/out
          _firebaseAuth.onAuthStateChanged
              .map((FirebaseUser user) => user?.uid);

  // Email & password Sign Up
  Future<String> createUserWithEmailAndPassword(
      {String email, String password, String username}) async {
    //this method is actually already part of the the fb auth package so we just gonna keep the names
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    //update the username of the newly created user
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = username;
    await authResult.user.updateProfile(userUpdateInfo);
    await authResult.user.reload();
    return authResult.user.uid;
  }

  // Email & password Sign In
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user
        .uid;
  }

  // Sign Out
  signOut() {
    return _firebaseAuth.signOut();
  }
}
