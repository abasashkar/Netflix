import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _errormes = '';

  bool get isLoading => _isLoading;
  String get errormes => _errormes;

  Future<void> LoginUser(String email, String password) async {
    _isLoading = true;
    _errormes = '';
    print('Login started');
    notifyListeners();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Login successful');
    } on FirebaseAuthException catch (error) {
      _errormes = error.message ?? 'An unknown error occurred.';
      print('Login failed: $_errormes');
    } catch (error) {
      _errormes = 'An unknown error occurred.';
      print('Login failed: $_errormes');
    } finally {
      _isLoading = false;
      notifyListeners();
      print('Login process finished');
    }
  }
}
