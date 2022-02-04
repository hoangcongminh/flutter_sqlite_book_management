import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider provider = DatabaseProvider();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'book_management.db');
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute("CREATE TABLE books ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title TEXT NOT NULL,"
            "releaseDate TEXT NOT NULL,"
            "author TEXT NOT NULL,"
            "image TEXT NOT NULL,"
            "type TEXT NOT NULL,"
            ");");
      },
      onUpgrade: (database, olderVersion, newVersion) async {
        await database.execute(" Drop TABLE IF EXISTS students ");

        await database.execute("CREATE TABLE books ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title TEXT NOT NULL,"
            "releaseDate TEXT NOT NULL,"
            "author TEXT NOT NULL,"
            "image TEXT NOT NULL,"
            "type TEXT NOT NULL,"
            ");");
      },
    );
    return database;
  }
}
