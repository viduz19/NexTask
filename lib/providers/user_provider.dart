import 'package:flutter/material.dart';
import '../services/api_service.dart';

class UserProvider extends ChangeNotifier {
  String _name = 'User';
  String _email = 'user@example.com';
  Color _profileColor = const Color(0xFF604652);
  bool _isAuthenticated = false;

  String get name => _name;
  String get email => _email;
  Color get profileColor => _profileColor;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String username, String password) async {
    try {
      final userData = await ApiService.login(username, password);
      _name = userData['username'];
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String username, String password) async {
    try {
      final userData = await ApiService.register(username, password);
      _name = userData['username'];
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void logout() {
    _isAuthenticated = false;
    ApiService.setToken('');
    notifyListeners();
  }

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void updateProfileColor(Color newColor) {
    _profileColor = newColor;
    notifyListeners();
  }
}
