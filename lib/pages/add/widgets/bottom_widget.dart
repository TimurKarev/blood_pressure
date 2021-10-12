import 'package:blood_pressure/pages/add/widgets/feel_widget.dart';
import 'package:blood_pressure/pages/add/widgets/pills_widget.dart';
import 'package:blood_pressure/pages/add/widgets/time_widger.dart';
import 'package:blood_pressure/pages/add/widgets/top_input_card.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomInputWidget extends StatefulWidget {
  const BottomInputWidget({Key? key}) : super(key: key);

  @override
  _BottomInputWidgetState createState() => _BottomInputWidgetState();
}

class _BottomInputWidgetState extends State<BottomInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Status:", style: Styles.headerNormal),
        const TopInputCard(),
        const Text("Time:", style: Styles.headerNormal),
        TimeWidget(),
        const Text("How do you feel?:", style: Styles.headerNormal),
        const FeelWidget(),
        const Text(
          "Have you taken any pills?:",
          style: Styles.headerNormal,
        ),
        const PillsWidget(),
      ],
    );
  }
}
