import 'package:blood_pressure/styles.dart';
import 'package:blood_pressure/utils/diag_mapping.dart';
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
  final String feel;

  const MeasurementRow({
    Key? key,
    required this.dia,
    required this.sys,
    required this.pulse,
    required this.type,
    required this.badgeText,
    required this.feel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tale = Container();
    Widget badge = Container();

    switch (type) {
      case CardType.input:
        tale = Container();
        badge = BadgeDiagWidget(text: badgeText);
        break;
      case CardType.history:
        tale = _getImageFromFeelings(feel);
        badge = SizedBox(
          height: 45,
          child: SimpleDiagWidget(
            text: badgeText,
            isHistory: true,
          ),
        );
        break;
      case CardType.main:
        tale = _getImageFromFeelings(feel);
        badge = BadgeDiagWidget(text: badgeText);
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        const SizedBox(height: 10.0),
        Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: badge,
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: tale,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //TODO: Refactor to widget
  Widget _getImageFromFeelings(String feel) {
    Widget retWidget = Container();
    switch (feel) {
      case "Normal":
        retWidget = Image.asset(
          "assets/png/normal_grey.png",
          color: getColorFromDiag(feel),
          fit: BoxFit.fill,
        );
        break;
      case "Bad":
        retWidget = Image.asset(
          "assets/png/bad_grey.png",
          color: getColorFromDiag(feel),
          fit: BoxFit.fill,
        );
        break;
      case "Good":
        retWidget = Image.asset(
          "assets/png/good_grey.png",
          color: getColorFromDiag(feel),
          fit: BoxFit.fill,
        );
        break;
    }
    return SizedBox(
      width: 29.0,
      height: 29.0,
      child: retWidget,
    );
  }
}

class BadgeDiagWidget extends StatelessWidget {
  final String text;

  const BadgeDiagWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          color: getColorFromDiag(text),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: SimpleDiagWidget(text: text),
    );
  }
}

class SimpleDiagWidget extends StatelessWidget {
  final String text;
  final bool isHistory;

  const SimpleDiagWidget({Key? key, required this.text, this.isHistory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color? color = isHistory ? getColorFromDiag(text) : null;
    return Row(
      mainAxisAlignment:
          isHistory ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/png/heart_pulse.png",
          color: color,
        ),
        Text(
          "  $text",
          style: Styles.inputBageText.copyWith(color: color),
        ),
      ],
    );
  }
}
