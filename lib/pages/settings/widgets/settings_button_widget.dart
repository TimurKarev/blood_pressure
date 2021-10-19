import 'package:blood_pressure/styles.dart';
import 'package:flutter/material.dart';

class SettingsButtonWidget extends StatelessWidget {
  const SettingsButtonWidget({Key? key, required this.text, this.onTap}) : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
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
      ),
    );
  }
}
