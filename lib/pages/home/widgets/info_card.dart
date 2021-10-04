import 'package:blood_pressure/model/measurement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final Measurement measurement;

  const InfoCard(this.measurement, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('dd.MM');
    final DateFormat timeFormatter = DateFormat('hh:mm');
    final date = dateFormatter.format(measurement.time);
    final time = timeFormatter.format(measurement.time);
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Text("$date, $time"),
          Text("${measurement.sys} / ${measurement.dia}    ${measurement.pulse}"),
          Text("Pills: ${measurement.pills}"),
        ],
      ),
    );
  }
}
