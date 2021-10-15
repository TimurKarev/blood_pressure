import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/repository/measurement_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum HomePageLandingState {
  loading,
  empty,
  notEmpty,
}

final viewModelProvider =
    ChangeNotifierProvider<HomePageViewModel>(
        (ref) => HomePageViewModel(ref.read(dbRepositoryProvider)));

class HomePageViewModel extends ChangeNotifier {
  final MeasurementRepository repository;

  HomePageLandingState isEmptyState = HomePageLandingState.loading;
  List<Measurement> historyMeasurements = [];
  Measurement? lastMeasurement;
  List<Measurement> allMeasurements = [];

  HomePageViewModel(this.repository) {
    update();
  }

  Future<void> update() async {
    allMeasurements =
        await repository.getAllMeasurements();
    if (allMeasurements.isNotEmpty) {
      isEmptyState = HomePageLandingState.notEmpty;
      List<Measurement> allMeasurementsRev =
          List.from(allMeasurements.reversed);
      lastMeasurement = allMeasurementsRev[0];
      if (allMeasurements.length > 1) {
        historyMeasurements = allMeasurementsRev.sublist(1);
      }
    } else {
      isEmptyState = HomePageLandingState.empty;
    }
    notifyListeners();
  }

  Future<int> addMeasurement(Measurement measurement) async {
    int result = await repository.addMeasurement(measurement);
    await update();
    return result;
  }
}
