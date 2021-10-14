import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';

//TODO: Need Refactor and null check

const Map<String, Color> _diagnosesToColorMap = {
  "Low blood pressure": Styles.lowBloodPressureColor,
  "Normal": Styles.normalPressureColor,
  "Prehypertension": Styles.prehypertensionColor,
  "Hypertension Stage 1": Styles.hypertensionStage1Color,
  "Нypertension Stage 2": Styles.hypertensionStage2Color,
  "Seek Emergency Care": Styles.seekEmergencyCareColor,
};

Color getColorFromDiag(String diag) =>
    _diagnosesToColorMap[diag] ?? Styles.primaryColor;
