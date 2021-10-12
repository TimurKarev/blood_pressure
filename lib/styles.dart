import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const TextStyle base = TextStyle(
    fontSize: 16,
    // fontStyle: FontStyle.normal,
    // fontWeight: FontWeight.w600,
  );

  static const TextStyle inputBageText = TextStyle(
    fontSize: 16,
    color: CupertinoColors.white,
    // fontStyle: FontStyle.normal,
    // fontWeight: FontWeight.w600,
  );

  static const TextStyle headerNormal = TextStyle(
    fontSize: 20,
    // fontStyle: FontStyle.normal,
    // fontWeight: FontWeight.w600,
  );

  static const TextStyle textInputText = TextStyle(
    fontSize: 24,
    // fontStyle: FontStyle.normal,
    // fontWeight: FontWeight.w600,
  );

  static const TextStyle headerNormalGray = TextStyle(
    color: CupertinoColors.inactiveGray,
    fontSize: 20,
    // fontStyle: FontStyle.normal,
    // fontWeight: FontWeight.w600,
  );

  static const TextStyle headerBig = TextStyle(
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headerBigGrey = TextStyle(
    color: CupertinoColors.inactiveGray,
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headerSmall = TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle topInputCardText = TextStyle(
    fontSize: 36,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle topInputCardTextGrey = TextStyle(
    fontSize: 36,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: CupertinoColors.inactiveGray,
  );

  static const TextStyle smallTopCardTextGrey = TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: CupertinoColors.inactiveGray,
  );

  static const Color primaryColor = CupertinoColors.white;

  static const Color iconColor = CupertinoColors.systemGrey3;

  static const Color cursorColor = CupertinoColors.black;

  static const Color buttonColor = Color(0xffaf52de);

  static const Color buttonDisableColor = CupertinoColors.systemGrey2;

  static const Color lowBloodPressureColor = Color(0xff8EAD97);

  static const Color normalPressureColor = Color(0xff8CCD4A);

  static const Color prehypertensionColor = Color(0xffDFBD0B);

  static const Color hypertensionStage1Color = Color(0xffE4A52A);

  static const Color hypertensionStage2Color = Color(0xffF07336);

  static const Color seekEmergencyCareColor = Color(0xffD55932);

  static const Color badgeBadColor = Color(0xffFF5B52);

  static const Color badgeNormalColor = Color(0xffF5CF43);

  static const Color badgeGoodColor = Color(0xff8CCD4A);

  static const Color emptyPageColor = Color(0xff9681D0);

}
