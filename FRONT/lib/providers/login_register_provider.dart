import 'package:flutter/material.dart';

class LoginRegisterProvider extends ChangeNotifier {
  bool _rememberLogin = true;

  bool get rememberLogin {
    return _rememberLogin;
  }

  updateRemember(bool value) {
    _rememberLogin = value;
    notifyListeners();
  }
} 