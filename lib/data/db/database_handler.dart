import 'dart:io';

import 'package:FReader/domain/model/book.dart';
import 'package:FReader/domain/repository/chapter_repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:FReader/domain/repository/book_repository.dart';

class AppDatabaseHelper {
  static final _databaseName = "app.db";
  static final _databaseVersion = 1;
  AppDatabaseHelper._privateConstructor();
  static final AppDatabaseHelper instance = AppDatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _createDb);
  }

  void _createDb(Database db, int newVersion) async {
    await BookRepository.createDb(db);
    await ChapterRepository.createDb(db);

  }

  Future<List<Map<String, dynamic>>> getLibraryBooks() async {
    Database db = await this.database;
    var result = await db.query(BookRepository.tableName, orderBy: "${BookRepository.columnId} ASC");
    return result;
  }
  Future<int> insert(Book book) async {
    Database db = await instance.database;
    var res = await db.insert(BookRepository.tableName, book.toMap());
    return res;
  }

  close() async {
    var db = await this.database;
    var result = db.close();
    return result;
  }
}