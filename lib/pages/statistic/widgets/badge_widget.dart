import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    Key? key,
    this.active = false,
    required this.text,
    required this.onTap,
    required this.activeColor,
  }) : super(key: key);

  final bool active;
  final String text;
  final Function() onTap;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: active
              ? Border.all(
                  color: activeColor
                )
              : null,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: active ? activeColor : null,
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.base.copyWith(
              color:
                  active ? CupertinoColors.white : CupertinoColors.inactiveGray,
            ),
          ),
        ),
      ),
    );
  }
}
