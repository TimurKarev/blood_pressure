import 'package:blood_pressure/database/measurement_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final daoProvider = Provider<MeasurementDao>((ref) {
  final db = ref.read(dbProvider);
  return MeasurementDao(db);
});

class MeasurementDao {

  final DatabaseProvider _database;

  MeasurementDao(this._database);

  Future<int> addMeasurement(Map<String, dynamic> measurement) async {
    final db = _database.database;
    var result = await db.insert(_database.tableName, measurement);
    return result;
  }

  Future<List<Map<String, dynamic>>> getMeasurementList () async {
    final db = _database.database;
    return await db.query(_database.tableName);
  }
}