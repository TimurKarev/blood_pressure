import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';

const Map<String, Color> diagMap = {
  "Low blood pressure": Styles.lowBloodPressureColor,
  "Normal": Styles.normalPressureColor,
  "Prehypertension": Styles.prehypertensionColor,
  "Hypertension Stage 1": Styles.hypertensionStage1Color,
  "Нypertension Stage 2": Styles.hypertensionStage2Color,
  "Seek Emergency Care": Styles.seekEmergencyCareColor,
};

Color getColorFromDiag(String diag) => diagMap[diag] ?? Styles.primaryColor;
