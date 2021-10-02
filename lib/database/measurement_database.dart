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
  late Database database;

  DatabaseProvider() {
    open();
  }

  open() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, "Measurement.db");
    database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
  }

  close() async {
    await database.close();
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
        "diagnosis TEXT, "
        ")");
  }
}