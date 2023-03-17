import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/user.dart';

class SQLDatabase {
  Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      return _database = await initialDatabase();
    } else {
      return _database;
    }
  }

  initialDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'task.db');
    Database initDatabase =
        await openDatabase(path, onCreate: _onCreate, version: 1);
    return initDatabase;
  }

  // for sql
  String tableName = 'userData';
  String columnId = 'id';
  String columnName = 'name';
  String columnAddress = 'address';

  // create tables
  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName 
    (
    $columnId INTEGER PRIMARY KEY,
    $columnName TEXT,
    $columnAddress TEXT
    )
    ''');
    if (kDebugMode) {
      print('database and tables are created --------------------------------');
    }
  }

  // = select
  Future<List<User>> readDatabase() async {
    Database? readDatabase = await database;
    List<Map<String, Object?>> response = await readDatabase!.rawQuery('''
        SELECT * FROM $tableName
    ''');
    final List<User> users =
        response.map<User>((jsonUser) => User.fromJson(jsonUser)).toList();
    print('read --------------------------------');
    return users;
  }

  // = insert
  Future<int> insertDatabase(User user) async {
    Database? insertDatabase = await database;
    Future<int> response = insertDatabase!.rawInsert('''
    INSERT INTO 
    $tableName ($columnName , $columnAddress) 
    VALUES ("${user.name}" , "${user.address}")
    ''');
    print('inserted --------------------------------');
    return response;
  }
}
