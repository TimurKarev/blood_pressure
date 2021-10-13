import 'package:blood_pressure/pages/home/widgets/home_full_page.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final ButtonButtonEnum button;
  final Function(ButtonButtonEnum) callbackFunction;

  const BottomButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.button,
    required this.callbackFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      onPressed: () => callbackFunction(button),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 40.0,
            color: Styles.iconColor,
          ),
          Text(
            text,
            style: const TextStyle().copyWith(color: Styles.iconColor),
          ),
        ],
      ),
    );
  }
}
