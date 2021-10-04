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

  HomePageViewModel(this.repository) {
    update();
  }

  Future<void> update() async {
    List<Measurement> allMeasurementsRev =
        await repository.getAllMeasurements();
    if (allMeasurementsRev.isNotEmpty) {
      isEmptyState = HomePageLandingState.notEmpty;
      List<Measurement> allMeasurements =
          List.from(allMeasurementsRev.reversed);
      lastMeasurement = allMeasurements[0];
      if (allMeasurements.length > 1) {
        historyMeasurements = allMeasurements.sublist(1);
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
