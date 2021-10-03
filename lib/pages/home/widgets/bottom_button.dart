import 'package:blood_pressure/pages/home/widgets/home_full_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final ButtonButtonEnum button;
  final Function(ButtonButtonEnum) callbackFunction;

  const BottomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.button,
    required this.callbackFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        onPressed: () => callbackFunction(button),
        child: Column(children: [
          icon,
          Text(text),
        ]),
      ),
    );
  }
}
