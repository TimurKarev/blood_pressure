import 'package:blood_pressure/model/measurement.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  final Measurement measure;

  const InfoCard({Key? key, required this.measure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('dd.MM');
    final DateFormat timeFormatter = DateFormat('hh:mm');
    final date = dateFormatter.format(measure.time);
    final time = timeFormatter.format(measure.time);
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Text("$date, $time"),
          Text("${measure.sys} / ${measure.dia}    ${measure.pulse}"),
          Text("Pills: ${measure.pills}"),
        ],
      ),
    );
  }
}
