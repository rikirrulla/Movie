import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeModel extends ChangeNotifier {
  get isVisible => _isVisible;
  bool _isVisible = false;

  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;
  void isValidEmail(String input) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(input);
    if (emailValid) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }

  get isValidRegister => _isValidRegister;
  bool _isValidRegister = false;
  void isValidEmailRegister(String input) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(input);
    if (emailValid) {
      _isValidRegister = true;
    } else {
      _isValidRegister = false;
    }
    notifyListeners();
  }
}