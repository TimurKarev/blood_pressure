import 'package:blood_pressure/styles.dart';
import 'package:blood_pressure/utils/color_to_diag_mapping.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum CardType {
  input,
  main,
  history,
}

class MeasurementRow extends StatelessWidget {
  final String dia;
  final String sys;
  final String pulse;
  final CardType type;
  final String badgeText;

  const MeasurementRow({
    Key? key,
    required this.dia,
    required this.sys,
    required this.pulse,
    required this.type,
    required this.badgeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      sys,
                      style: Styles.topInputCardText,
                    ),
                    const Text(
                      " / ",
                      style: Styles.topInputCardTextGrey,
                    ),
                    Text(
                      dia,
                      style: Styles.topInputCardText,
                    ),
                  ],
                ),
                const Text("SYS/DIA", style: Styles.smallTopCardTextGrey),
              ],
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 12.0,
                      ),
                      Image.asset(
                        "assets/png/heart.png",
                      ),
                    ],
                  ),
                  const SizedBox(width: 7.0),
                  Column(
                    children: [
                      Text(
                        pulse,
                        style: Styles.topInputCardText,
                      ),
                      const Text("BMP", style: Styles.smallTopCardTextGrey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: getColorFromDiag(badgeText),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/png/heart_pulse.png"),
                      Text("  $badgeText",
                          style: Styles.inputBageText),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}