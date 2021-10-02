import 'package:blood_pressure/dao/measurement_dao.dart';
import 'package:blood_pressure/model/measurement.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbRepositoryProvider = ChangeNotifierProvider(
    (ref) => MeasurementRepository(ref.read(daoProvider)));

class MeasurementRepository extends ChangeNotifier {
  final MeasurementDao _measurementDao;

  MeasurementRepository(this._measurementDao);

  Future<int> addMeasurement(Measurement measurement) async {
    final result = await _measurementDao.addMeasurement(measurement.toMap());
    if (result != 0) {
      notifyListeners();
    }
    return result;
  }

  Future<List<Measurement>> getAllMeasurements() async {
    final List<Map<String, dynamic>> rawData =
        await _measurementDao.getMeasurementList();
    List<Measurement> result = [];

    for (var element in rawData) {
      result.add(Measurement.fromMap(element));
    }
    return result;
  }
}
