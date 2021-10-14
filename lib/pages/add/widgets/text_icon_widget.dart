import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  static const _radius = 10.0;

  final bool isActive;
  final String text;
  final String? iconAssetPath;
  final Color activeColor;
  final Function() onTap;

  const TextIconWidget({
    Key? key,
    this.isActive = false,
    required this.text,
    this.iconAssetPath,
    required this.activeColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = isActive ? activeColor : CupertinoColors.inactiveGray;

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconAssetPath!=null)
              Image.asset(iconAssetPath!, color: color),
            Text(
              " " + text,
              style: Styles.inputBageText.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}