import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Icon icon;
  final String text;

  const BottomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Column(
          children:[
            icon,
            Text(text),

          ]
        ),
      ),
    );
  }
}
