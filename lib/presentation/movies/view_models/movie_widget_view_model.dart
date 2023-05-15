import 'package:flutter/material.dart';

class MovieWidgetViewModel extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isError = false;

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  String _errorMsg = '';

  String get errorMsg => _errorMsg;

  set errorMsg(String value) {
    _errorMsg = value;
    notifyListeners();
  }
}
