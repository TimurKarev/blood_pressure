import 'package:blood_pressure/database/measurement_database.dart';
import 'package:sqflite/sqflite.dart';



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