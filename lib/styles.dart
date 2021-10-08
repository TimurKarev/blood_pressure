import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {

  static const TextStyle base = TextStyle(
    fontSize: 16,
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

  static const Color primaryColor = CupertinoColors.white;

  static const Color iconColor = CupertinoColors.systemGrey3;

  static const Color cursorColor = CupertinoColors.black;

  static const Color buttonColor = Color(0xffaf52de);

  static const Color buttonDisableColor = CupertinoColors.systemGrey2;
}