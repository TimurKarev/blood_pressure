String getDiagnosis(int sys, int dia, int pulse) {
  String diagnosis = '';
  if (sys <= 0) {
    return "Unknown";
  } else if (sys < 90) {
    diagnosis = "Low blood pressure";
  } else if (sys >= 90 && sys < 120) {
    diagnosis = "Normal";
  } else if (sys >= 120 && sys < 140) {
    diagnosis = "Prehypertension";
  } else if (sys >= 140 && sys < 170) {
    diagnosis = "Hypertension Stage 1";
  } else if (sys >= 170 && sys < 220) {
    diagnosis = "Нypertension Stage 2";
  } else if (sys >= 220) {
    diagnosis = "Seek Emergency Care";
  }
  return diagnosis;
}
