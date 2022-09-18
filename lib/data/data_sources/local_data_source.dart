import 'package:sqflite/sqflite.dart';

abstract class LocalDataSource {}

class SqliteDataSource implements LocalDataSource {
  final Database _database;

  SqliteDataSource({
    required Database database
  }): _database = database;

}