import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardTextWidget extends StatelessWidget {
  final String header;
  final String text;

  const OnBoardTextWidget({
    Key? key,
    required this.header,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(child: Text(header, style: Styles.headerNormal)),
      const SizedBox(height: 20.0),
      Center(
          child: Text(
            text,
            style: Styles.base,
            textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
          )),
    ]);
  }
}