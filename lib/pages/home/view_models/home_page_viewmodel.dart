import 'package:blood_pressure/model/measurement.dart';
import 'package:blood_pressure/repository/measurement_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isHistoryEmptyProvider = FutureProvider<bool>((ref) async {
  final dbRepo = ref.watch(dbRepositoryProvider);
  return await dbRepo.getHistoryLength() == 0? false : true;
});

final historyListProvider = FutureProvider<List<Measurement>>((ref) async {
  final dbRepo = ref.watch(dbRepositoryProvider);
  return await dbRepo.getAllMeasurements();
});