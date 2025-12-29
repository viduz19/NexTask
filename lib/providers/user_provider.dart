import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = 'User';
  String _email = 'user@example.com';
  Color _profileColor = const Color(0xFF604652); // Default primary color

  String get name => _name;
  String get email => _email;
  Color get profileColor => _profileColor;

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
