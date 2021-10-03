import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final dbProvider = Provider<DatabaseProvider>((ref) {
  var database = DatabaseProvider();
  ref.onDispose(() => database.close());
  return database;
});

class DatabaseProvider {

  final tableName = 'Measurement';
  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      await open();
    }
    return _database!;
  }

  Future<void> open() async {
    var databasePath = await getDatabasesPath();
    //"ReactiveTodo.db is our database instance name
    print(databasePath.toString());
    String path = join(databasePath, "Measurement.db");
    _database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
  }

  close() async {
    if (_database!= null) {
      await _database!.close();
    }
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $tableName ("
        "id INTEGER PRIMARY KEY, "
        "sys INTEGER, "
        "dia INTEGER, "
        "pulse INTEGER, "
        "pills TEXT, "
        "time INTEGER, "
        "diagnosis TEXT "
        ");");
  }
}