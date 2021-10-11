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
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Status:", style: Styles.headerNormal),
          ),
        ),
        const Flexible(
          flex: 3,
          child: TopInputCard(),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Time:", style: Styles.headerNormal),
          ),
        ),
        Flexible(
          flex: 1,
          child: TimeWidget(),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, bottom:10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("How do you feel?:", style: Styles.headerNormal),
          ),
        ),
        const Flexible(
          flex: 1,
          child: FeelWidget(),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Have you taken any pills?:",
              style: Styles.headerNormal,
            ),
          ),
        ),
        const Flexible(
          flex: 2,
          child: PillsWidget(),
        ),
      ],
    );
  }
}
