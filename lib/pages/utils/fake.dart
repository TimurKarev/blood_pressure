import 'dart:math';

import 'package:flutter/material.dart';

class Fake extends StatelessWidget {
  final Color? color;
  final String str;
  final Widget? child;
  final bool border;
  final double radius;

  const Fake(this.str, {Key? key, this.color, this.child, this.border=false, this.radius=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random rnd = Random();
    return Container(
      decoration: BoxDecoration(
        border: border?Border.all():null,
        color: color ??
            Color.fromARGB(
                rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255), 1),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: child,
    );
  }
}
