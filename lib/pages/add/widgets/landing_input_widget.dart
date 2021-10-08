import 'package:blood_pressure/pages/add/widgets/button_widget.dart';
import 'package:blood_pressure/pages/add/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LandingInputWidget extends StatelessWidget {
  const LandingInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 10,
          child: TopInputWidget(),
        ),
        Flexible(
          flex: 3,
          child: ButtonWidget(),
        ),
      ],
    );
  }
}