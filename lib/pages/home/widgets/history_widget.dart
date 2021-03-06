import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/pages/home/view_models/home_page_viewmodel.dart';
import 'package:blood_pressure/pages/home/widgets/info_card.dart';
import 'package:blood_pressure/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryWidget extends ConsumerWidget {
  final ScrollController controller;

  const HistoryWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    List<Measurement> measurements =
        watch(viewModelProvider).historyMeasurements;
    return Container(
      color: Styles.backgroundColor,
      child: CustomScrollView(
        controller: controller,
        slivers: [
          const CupertinoSliverNavigationBar(
            backgroundColor: Styles.backgroundColor,
            largeTitle: Text("History:", style: Styles.headerBig),
            //middle: Text("History:", style: Styles.headerNormal),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 8.0,
                  ),
                  child: InfoCard(measurements[index]),
                );
              },
              childCount: measurements.length,
            ),
          ),
        ],
      ),
    );
  }
}
