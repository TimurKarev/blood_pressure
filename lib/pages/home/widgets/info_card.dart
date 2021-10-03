import 'package:blood_pressure/model/measurement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final Measurement measurements;

  const InfoCard(this.measurements, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('dd.MM');
    final DateFormat timeFormatter = DateFormat('hh:mm');
    final date = dateFormatter.format(measurements.time);
    final time = timeFormatter.format(measurements.time);
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Text("$date, $time"),
          Text("${measurements.sys} / ${measurements.dia}    ${measurements.pulse}"),
          Text("Pills: ${measurements.pills}"),
        ],
      ),
    );
  }
}
