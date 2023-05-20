
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class BookRepository {
  static String tableName = 'book';
  static String columnId = "_id";
  static String source = "source";
  static String url = "url";
  static String artist = "artist";
  static String author = "author";
  static String description = "description";
  static String genre = "genre";
  static String title = "title";
  static String status = "status";
  static String thumbnailUrl = "thumbnail_url";
  static String favorite = "favorite";
  static String lastUpdate = "last_update";
  static String nextUpdate = "next_update";
  static String initialized = "initialized";
  static String viewer = "viewer";
  static String chapterFlags = "chapter_flags";
  static String coverLastModified = "cover_last_modified";
  static String dateAdded = "date_added";
  static Future<void> createDb(Database db) async {
    await db.execute(
        '''CREATE TABLE IF NOT EXISTS $tableName(
        $columnId INTEGER NOT NULL PRIMARY KEY,
        $source INTEGER NOT NULL,
        $url TEXT NOT NULL,
        $artist TEXT,
        $author TEXT,
        $description TEXT,
        $genre TEXT,
        $title TEXT NOT NULL,
        $status INTEGER NOT NULL,
        $thumbnailUrl TEXT,
        $favorite INTEGER NOT NULL,
        $lastUpdate INTEGER,
        $nextUpdate INTEGER,
        $initialized INTEGER NOT NULL,
        $viewer INTEGER NOT NULL,
        $chapterFlags INTEGER NOT NULL,
        $coverLastModified INTEGER NOT NULL,
        $dateAdded INTEGER NOT NULL);'''
    );
  }
}