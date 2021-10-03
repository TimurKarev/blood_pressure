import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/pages/home/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HistoryWidget extends StatelessWidget {

  final ScrollController controller;
  final List<Measurement> measurements;

  const HistoryWidget({
    required this.measurements,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Measurement> historyMeasurements = [];
    if (measurements.isNotEmpty) {
      historyMeasurements = measurements.sublist(1);
    }

    return CustomScrollView(
      controller: controller,
      slivers: [
        const CupertinoSliverNavigationBar(
          largeTitle: Text("History"),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return InfoCard(historyMeasurements[index]);
            },
            childCount: historyMeasurements.length,
          ),
        ),
      ],
    );
  }
}
