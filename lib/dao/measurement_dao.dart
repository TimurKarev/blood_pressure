import 'package:blood_pressure/database/measurement_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart';

final daoProvider = Provider<MeasurementDao>((ref) {
  final db = ref.read(dbProvider);
  return MeasurementDao(db);
});

class MeasurementDao {

  final DatabaseProvider _database;

  MeasurementDao(this._database);

  Future<int> addMeasurement(Map<String, dynamic> measurement) async {
    final db = await _database.database;
    var result = await db.insert(_database.tableName, measurement);
    return result;
  }

  Future<List<Map<String, dynamic>>> getMeasurementList () async {
    final db = await _database.database;
    return await db.query(_database.tableName);
  }

  Future<int> getTableLength() async {
    final db = await _database.database;
    int? count = firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM ${_database.tableName}'));
    return count ?? 0;
  }
}