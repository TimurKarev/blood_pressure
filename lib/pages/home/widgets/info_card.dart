import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final Measurement measurement;
  final bool isHistory;

  const InfoCard(this.measurement, {Key? key, this.isHistory = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('dd.MM');
    final DateFormat timeFormatter = DateFormat('hh:mm');
    final date = dateFormatter.format(measurement.time);
    final time = timeFormatter.format(measurement.time);
    return Card(
      color: CupertinoColors.white,
      child: SizedBox(
        width: double.infinity,
        height: isHistory ? 193 : 250.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                "$date, $time",
                style: Styles.base.copyWith(
                  color: isHistory
                      ? CupertinoColors.inactiveGray
                      : CupertinoColors.black,
                ),
              ),
              Text(
                  "${measurement.sys} / ${measurement.dia}    ${measurement.pulse}"),
              Text("Pills: ${measurement.pills}"),
            ],
          ),
        ),
      ),
    );
  }
}
