import 'package:flutter/material.dart';

enum NotifierState { initial, loading, loaded }

class BaseProvider extends ChangeNotifier {
  NotifierState _notifierState = NotifierState.initial;
  bool _isError = false;
  String _errorMessage = '';

  // getters
  NotifierState get notifierState => _notifierState;
  bool get isError => _isError;
  String get errorMessage => _errorMessage;

  // set error
  void setError(String errorMessage) {
    _isError = true;
    _errorMessage = errorMessage;
    // notifyListeners();
  }

  // clear error
  void clearError() {
    _isError = false;
    _errorMessage = '';
    // notifyListeners();
  }

  // update state
  void updateState(NotifierState newState) {
    _notifierState = newState;
    notifyListeners();
  }
}
