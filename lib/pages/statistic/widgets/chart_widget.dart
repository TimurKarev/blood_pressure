/// Bar chart example
import 'package:blood_pressure/pages/statistic/view_model/statictic_view_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {

  final bool animate;
  final List<HistoryData> historyDates;

  const ChartWidget({Key? key, this.animate = true, required this.historyDates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<charts.Series<dynamic, String>> seriesList = [
      charts.Series<HistoryData, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (HistoryData data, _) => data.time,
        measureFn: (HistoryData data, _) => data.value,
        data: historyDates,
      )
    ];
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }
}