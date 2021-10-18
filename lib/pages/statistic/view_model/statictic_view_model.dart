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

  int _interval = 0;

  int get interval => _interval;

  set interval(int value) {
    _interval = value;
    notifyListeners();
  }

  int _measure = 0;

  int get measure => _measure;

  set measure(int value) {
    _measure = value;
    notifyListeners();
  }

  StatisticViewModel(this.reader) {
    init();
  }

  void init() {
    _measurements = reader(viewModelProvider).allMeasurements;
  }

  List<HistoryData> getChartData() {
    if (interval == 0) {
      return dayData;
    }

    return historyData;
  }

  List<HistoryData> get dayData {
    init();
    List<HistoryData> dayData = [];
    DateTime today = getStartTime();
    final DateFormat timeFormatter = DateFormat('hh:mm');
    for (var element in _measurements) {
      if (element.time.isSameDay(today)) {
        dayData.add(
          HistoryData(
            time: timeFormatter.format(element.time).toString(),
            value: measure == 0 ? element.sys : element.pulse,
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
    String time = getTimeString(currentDay);

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
        time = getTimeString(currentDay);
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

  DateTime getStartTime() {
    if (_interval == 0) {
      return DateTime.now();
    }
    if (_interval == 1) {
      return DateTime.now().previousWeek.addDays(1);
    }
    if (_interval == 2) {
      return DateTime.now().previousMonth.addDays(1);
    }
    if (_interval == 3) {
      return DateTime.now().previousYear.addDays(1);
    }
    return DateTime.now();
  }

  String getTimeString(DateTime currentTime) {
    if (_interval == 1) {
      return DateFormat('EEEE').format(currentTime).substring(0, 3);
    }
    if (_interval == 2) {
      return DateFormat('dd').format(currentTime); //.substring(0, 3);
    }
    if (_interval == 3) {
      return DateFormat('MMMM').format(currentTime).substring(0, 3);
    }
    return "empt";
  }

  bool checkCurrentIsSame(DateTime current, DateTime checked) {
    if (_interval == 1) {
      return current.isSameDay(checked);
    }
    if (_interval == 2) {
      return current.isSameDay(checked);
    }
    if (_interval == 3) {
      return current.isSameMonth(checked);
    }

    return false;
  }

  DateTime getNextCurrentTime(DateTime currentTime, int currentInterval) {
    if (_interval == 1) {
      return currentTime.subDays(currentInterval);
    }
    if (_interval == 2) {
      return currentTime.subDays(currentInterval);
    }
    if (_interval == 3) {
      return currentTime.subMonths(currentInterval);
    }
    return currentTime.subDays(currentInterval);
  }

  int getMeasurementData(Measurement measurement) =>
      _measure == 0 ? measurement.sys : measurement.pulse;

  List<HistoryData> get historyData {
    init();

    List<HistoryData> intervalHistoryData = [];
    List<Measurement> intervalMeasurementData = [];
    DateTime prevWeek = getStartTime();

    for (var element in _measurements) {
      if (element.time.isSameOrAfter(prevWeek)) {
        intervalMeasurementData.add(element);
      }
    }

    intervalMeasurementData.sort((a, b) => b.time.compareTo(a.time));

    DateTime currentTime = _measurements.last.time;
    num sum = 0;
    int amount = 0;
    //int currentInterval = 0;
    int measureIndex = 0;
    String timeString = getTimeString(currentTime);

    while (measureIndex < intervalMeasurementData.length) {
      if (checkCurrentIsSame(
          currentTime, intervalMeasurementData[measureIndex].time)) {
        sum += getMeasurementData(intervalMeasurementData[measureIndex]);
        amount++;
        measureIndex++;
      } else {
        if (amount > 0) {
          intervalHistoryData.add(
            HistoryData(time: timeString, value: sum / amount),
          );
        }
        sum = 0;
        amount = 0;
        //currentInterval++;
        currentTime = getNextCurrentTime(currentTime, 1);
        timeString = getTimeString(currentTime);
      }
    }
    if (amount > 0) {
      intervalHistoryData.add(
        HistoryData(time: timeString, value: sum / amount),
      );
    }
    return intervalHistoryData;
  }
}
