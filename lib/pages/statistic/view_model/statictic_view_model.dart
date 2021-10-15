import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/pages/home/view_models/home_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dart_date/dart_date.dart';
import 'package:intl/intl.dart';

final statisticViewModelProvider =
    ChangeNotifierProvider((ref) => StatisticViewModel(ref.read));

class HistoryData {
  final String time;
  final num value;

  HistoryData({required this.time, required this.value});
}

class StatisticViewModel extends ChangeNotifier {
  final Reader reader;
  List<Measurement> _measurements = [];

  StatisticViewModel(this.reader) {
    init();
  }

  void init() {
    _measurements = reader(viewModelProvider).allMeasurements;
  }

  List<HistoryData> get dayPulse {
    init();
    List<HistoryData> dayData = [];
    DateTime today = DateTime.now();
    final DateFormat timeFormatter = DateFormat('hh:mm');
    for (var element in _measurements) {
      if (element.time.isSameDay(today)) {
        dayData.add(
          HistoryData(
            time: timeFormatter.format(element.time).toString(),
            value: element.pulse,
          ),
        );
      }
    }
    return dayData;
  }
}
