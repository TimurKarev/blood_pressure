import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPageViewModelProvider =
    ChangeNotifierProvider<AddPageViewModel>((ref) => AddPageViewModel());

class AddPageViewModel extends ChangeNotifier {
  bool isButtonEnabled = false;
  String buttonText = 'Continue';

  int? _sys;
  int? _dia;
  int? _pulse;

  set sys(int? value) {
    _sys = value;
    updateStates();
  }

  set dia(int? value) {
    _dia = value;
    updateStates();
  }

  set pulse(int? value) {
    _pulse = value;
    updateStates();
  }

  updateStates() {
    final bool prevValue = isButtonEnabled;
    isButtonEnabled = _checkTopState();
    if (prevValue != isButtonEnabled) {
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
