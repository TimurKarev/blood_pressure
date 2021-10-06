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
    fontSize: 20,
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

  static const TextStyle productRowTotal = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle productRowItemPrice = TextStyle(
    color: Color(0xFF8E8E93),
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle searchText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle deliveryTimeLabel = TextStyle(
    color: Color(0xFFC2C2C2),
    fontWeight: FontWeight.w300,
  );

  static const TextStyle deliveryTime = TextStyle(
    color: CupertinoColors.inactiveGray,
  );

  static const Color primaryColor = CupertinoColors.white;

  static const Color cursorColor = CupertinoColors.black;

  static const Color searchBackground = Color(0xffe0e0e0);

  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);

  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);
}