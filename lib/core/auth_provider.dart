import 'package:assignment_customer_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _emailOrPhone;

  String? get emailOrPhone => _emailOrPhone;

  bool get isLoggedIn =>
      emailOrPhone != null && _emailOrPhone!.trim().isNotEmpty;

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _emailOrPhone = prefs.getString(emailOrPhoneKey);
    notifyListeners();
  }

  Future<void> setEmailOrPhone(String emailOrPhone) async {
    _emailOrPhone = emailOrPhone;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(emailOrPhoneKey, emailOrPhone);
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(emailOrPhoneKey);
    _emailOrPhone = null;
    notifyListeners();
  }
}
