import 'package:flutter/foundation.dart';
import 'package:edital_client/edital_client.dart';
import '../main.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _currentUser != null;

  String get userRole => _currentUser?.role ?? '';
  bool get isAdmin => userRole == 'admin';
  bool get isCommittee => userRole == 'committee';
  bool get isUser => userRole == 'user';

  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _clearError();

    try {
      // For demo purposes, we'll simulate login with a direct user lookup
      // In a real app, you'd have a proper authentication endpoint
      final user = await client.user.getUserByEmail(email);
      
      if (user != null && user.password == password) {
        _currentUser = user;
        notifyListeners();
        return true;
      } else {
        _setError('Invalid email or password');
        return false;
      }
    } catch (e) {
      _setError('Login failed: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> register(String name, String email, String password, String role) async {
    _setLoading(true);
    _clearError();

    try {
      final user = User(
        name: name,
        email: email,
        password: password,
        role: role,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final createdUser = await client.user.createUser(user);
      _currentUser = createdUser;
      notifyListeners();
      return true;
    } catch (e) {
      _setError('Registration failed: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> forgotPassword(String email) async {
    _setLoading(true);
    _clearError();

    try {
      // For demo purposes, just check if user exists
      final user = await client.user.getUserByEmail(email);
      if (user != null) {
        // In a real app, you'd send a password reset email
        _setError('Password reset email sent to $email');
        return true;
      } else {
        _setError('User with email $email not found');
        return false;
      }
    } catch (e) {
      _setError('Password reset failed: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void logout() {
    _currentUser = null;
    _clearError();
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }
}