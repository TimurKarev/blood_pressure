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

  List<HistoryData> get weekPulse {
    init();

    List<HistoryData> weekHistoryData = [];
    List<Measurement> weekMeasurementData = [];
    DateTime prevWeek = DateTime.now().previousWeek.addDays(1);
    //final DateFormat timeFormatter = DateFormat('hh:mm');

    for (var element in _measurements) {
      if (element.time.isSameOrAfter(prevWeek)) {
        weekMeasurementData.add(element);
      }
    }

    weekMeasurementData.sort((a, b) => b.time.compareTo(a.time));

    DateTime currentDay = _measurements.last.time;
    num sum = 0;
    int amount = 0;
    int i = 0;
    String time = DateFormat('EEEE').format(currentDay).substring(0, 3);

    for (var element in weekMeasurementData) {
      if (element.time.isSameDay(currentDay)) {
        sum += element.pulse;
        amount += 1;
      } else {
        if (amount > 0) {
          weekHistoryData.add(
            HistoryData(time: time, value: sum / amount),
          );
        }
        i++;
        currentDay = currentDay.subDays(i);
        time = DateFormat('EEEE').format(currentDay).substring(0, 3);
        amount = 0;
        sum = 0;

        sum += element.pulse;
        amount += 1;
      }
    }
    weekHistoryData.add(
      HistoryData(time: time, value: sum / amount),
    );
    return weekHistoryData;
  }
}
