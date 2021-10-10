import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPageViewModelProvider =
    ChangeNotifierProvider<AddPageViewModel>((ref) => AddPageViewModel());

class AddPageViewModel extends ChangeNotifier {
  init() {
    enableButton = false;
    buttonText = 'Continue';
    secondPartEdit = false;
    bageText = "";
    _sys = null;
    _dia = null;
    _pulse = null;
  }

  bool enableButton = false;
  String buttonText = 'Continue';
  bool secondPartEdit = false;
  String bageText = "";

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

      if (sys! < 90) {
        bageText = "Low blood pressure";
      } else if (sys! >= 90 && sys! < 120) {
        bageText = "Normal";
      } else if (sys! >= 120 && sys! < 140) {
        bageText = "Prehypertension";
      } else if (sys! >= 140 && sys! < 170) {
        bageText = "Hypertension Stage 1";
      } else if (sys! >= 170 && sys! < 220) {
        bageText = "Нypertension Stage 2";
      } else if (sys! >= 220) {
        bageText = "Seek Emergency Care";
      }

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
