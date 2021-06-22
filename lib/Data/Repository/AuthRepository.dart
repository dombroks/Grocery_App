import 'dart:io';

import 'package:grocery_app/Data/Remote/FirebaseSource.dart';

class AuthRepository {
  static AuthRepository _authRepository;

  static AuthRepository getInstance() {
    if (_authRepository == null) {
      _authRepository = AuthRepository();
      return _authRepository;
    } else {
      return _authRepository;
    }
  }

  FirebaseSource _firebaseSource = FirebaseSource.getInstance();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _firebaseSource.signInWithEmailAndPassword(email, password);
  }

  Future<bool> isLoggedIn() async {
    _firebaseSource.isLoggedIn();
  }

  Future signOut() async {
    _firebaseSource.signOut();
  }

  Future signUpWithEmailAndPassword(
      String username, String email, String password) async {
    _firebaseSource.signInWithEmailAndPassword(email, password);
  }

  Future addPhoneNumber(String phoneNumber, String numberPrefix) async {
    _firebaseSource.addPhoneNumber(phoneNumber, numberPrefix);
  }

  Future verifyPhoneNumber(String phoneNumber) async {
    _firebaseSource.verifyPhoneNumber(phoneNumber);
  }

  Future<void> resetPasswordWithEmail(String email) async {
    _firebaseSource.resetPasswordWithEmail(email);
  }

  Future uploadProfileImageToStorage(File image) async {
    _firebaseSource.uploadProfileImageToStorage(image);
  }

  Future<void> getProfileDetails() async {
    _firebaseSource.getProfileDetails();
  }

  Future getUserId() async {
    _firebaseSource.getUserId();
  }
}
