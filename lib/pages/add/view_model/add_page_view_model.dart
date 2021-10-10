import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPageViewModelProvider =
    ChangeNotifierProvider<AddPageViewModel>((ref) => AddPageViewModel());

class AddPageViewModel extends ChangeNotifier {
  bool enableButton = false;
  String buttonText = 'Continue';
  bool secondPartEdit = false;

  int? _sys;
  int? _dia;
  int? _pulse;

  set sys(int? value) {
    _sys = value;
    updateStates();
  }

  int? get sys => _sys;

  set dia(int? value) {
    _dia = value;
    updateStates();
  }

  int? get dia => _dia;

  set pulse(int? value) {
    _pulse = value;
    updateStates();
  }

  int? get pulse => _pulse;

  void buttonPressed() {
    if (_checkTopState()) {
      enableButton = false;
      buttonText = "Add measurement";
      secondPartEdit = true;
      notifyListeners();
    } else {
      enableButton = false;
      updateStates();
    }
  }

  updateStates() {
    final bool prevValue = enableButton;
    enableButton = _checkTopState();
    if (prevValue != enableButton) {
      notifyListeners();
    }
  }

  bool _checkTopState() {
    if (_sys != null && _dia != null && _pulse != null) {
      return true;
    } else {
      return false;
    }
  }
}
