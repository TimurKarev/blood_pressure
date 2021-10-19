import 'package:blood_pressure/styles.dart';
import 'package:flutter/material.dart';

class SettingsButtonWidget extends StatelessWidget {
  const SettingsButtonWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
          border: Border.all(
            color: Styles.buttonDisableColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(text, style: Styles.base),
            const Spacer(),
            Image.asset("assets/png/arrow.png"),
          ],
        ),
      ),
    );
  }
}
