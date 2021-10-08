import 'package:blood_pressure/pages/add/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';

class InputWidget extends StatelessWidget {
  final double _textFieldRadius = 6.0;

  const InputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              const Flexible(
                flex: 8,
                child: Text(
                  "New Measurement",
                  style: Styles.headerNormal,
                ),
              ),
              const Flexible(
                flex: 1,
                child: Icon(CupertinoIcons.xmark_circle_fill),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(),
        ),
        Flexible(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 1,
                child: Text(
                  "SYS",
                  style: Styles.headerNormal,
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputField(
                      width: 70.0,
                      placeholder: '120',
                      onEditingComplete: () {},
                      controller: null,
                    ),
                    const Text(
                      "DIA",
                      style: Styles.headerNormal,
                    ),
                    InputField(
                      width: 70.0,
                      placeholder: '80',
                      onEditingComplete: () {},
                      controller: null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                flex: 1,
                child: Text(
                  "Pulse",
                  style: Styles.headerSmall,
                ),
              ),
              Flexible(
                flex: 3,
                child: InputField(
                  //width: 70.0,
                  placeholder: '60',
                  onEditingComplete: () {},
                  controller: null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}