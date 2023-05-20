import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class ChapterRepository {

  static String tableName = 'chapter';
  static String columnId = '_id';
  static String bookId = 'book_id';
  static String url = 'url';
  static String name = 'name';
  static String scanlator = 'scanlator';
  static String read = 'read';
  static String bookmark = 'bookmark';
  static String lastPageRead = 'last_page_read';
  static String chapterNumber = 'chapter_number';
  static String sourceOrder = 'source_order';
  static String dateFetch = 'date_fetch';
  static String dateUpload = 'date_upload';
  static String content = 'content';
  static String type = 'type';

  static Future<void> createDb(Database db) async {
    await db.execute(
        """CREATE TABLE IF NOT EXISTS $tableName(
    $columnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
    $bookId INTEGER NOT NULL,
    $url TEXT NOT NULL,
    $name TEXT NOT NULL,
    $scanlator TEXT,
    $read INTEGER NOT NULL,
    $bookmark INTEGER NOT NULL,
    $lastPageRead INTEGER NOT NULL,
    $chapterNumber REAL NOT NULL,
    $sourceOrder INTEGER NOT NULL,
    $dateFetch INTEGER NOT NULL,
    $dateUpload INTEGER NOT NULL,
    $content TEXT NOT NULL,
    $type INTEGER NOT NULL);"""
   );
  }
}