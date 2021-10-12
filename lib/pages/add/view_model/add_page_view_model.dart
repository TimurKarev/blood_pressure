import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

//TODO: Name refactoring

final addPageViewModelProvider =
    ChangeNotifierProvider<AddPageViewModel>((ref) => AddPageViewModel());

class AddPageViewModel extends ChangeNotifier {

  bool enableButton = false;
  String buttonText = 'Continue';
  bool secondPartEdit = false;
  String bageText = "";
  bool bottomInputStart = false;

  DateTime dateTime = DateTime.now();

  String feelChoice = "";
  String pills = '';
  bool? _takePills;


  int? _sys;
  int? _dia;
  int? _pulse;

  init() {
    enableButton = false;
    buttonText = 'Continue';
    secondPartEdit = false;
    bageText = "";
    dateTime = DateTime.now();
    bottomInputStart = false;

    feelChoice = "";
    pills = '';
    _takePills = null;

    _sys = null;
    _dia = null;
    _pulse = null;
  }

  set sys(int? value) {
    _sys = value;
    _updateFirstStates();
  }

  int? get sys => _sys;

  set dia(int? value) {
    _dia = value;
    _updateFirstStates();
  }

  int? get dia => _dia;

  set pulse(int? value) {
    _pulse = value;
    _updateFirstStates();
  }

  int? get pulse => _pulse;

  String get date => DateFormat('dd.MM').format(dateTime);

  String get time => DateFormat('hh:mm').format(dateTime);

  set takePills(bool value) {
    _takePills = value;
    if (_takePills==false) {
      pills = '';
    }
    _checkSecondStateAndNotify();
  }

  buttonPressed() {
    if (secondPartEdit == false) {
      _buttonFirstPressed();
    } else {
      _buttonSecondPressed();
    }
  }

  void _buttonSecondPressed() {

  }

  void _buttonFirstPressed() {
    if (_checkFirstState()) {
      enableButton = false;
      buttonText = "Add measurement";
      secondPartEdit = true;
      dateTime = DateTime.now();

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
      _updateFirstStates();
    }
  }

  void pillsTextChanged(String newVal){
    pills = newVal;
    _checkSecondStateAndNotify();
  }

  void feelChoiceChanged(int choice) {
    switch (choice){
      case 0:
        feelChoice = "Good";
        break;
      case 1:
        feelChoice = "Normal";
        break;
      case 2:
        feelChoice = "Bad";
        break;
    }
    if (bottomInputStart==false) {
      bottomInputStart = true;
      //notifyListeners();
    }
    _checkSecondStateAndNotify();
  }

  _checkSecondStateAndNotify(){
    final bool prevValue = enableButton;
    enableButton = false;
    if (_takePills!=null) {
      if (feelChoice!= ""){
        if (_takePills==true && pills.isNotEmpty || _takePills==false){
          enableButton = true;
        }
      }
    }
    if (prevValue != enableButton) {
      notifyListeners();
    }
  }

  _updateFirstStates() {
    final bool prevValue = enableButton;
    enableButton = _checkFirstState();
    if (prevValue != enableButton) {
      notifyListeners();
    }
  }

  bool _checkFirstState() {
    if (_sys != null && _dia != null && _pulse != null) {
      return true;
    } else {
      return false;
    }
  }

}
