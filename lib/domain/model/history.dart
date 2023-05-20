

import 'package:FReader/domain/model/update.dart';

class History {
  int id;
  int chapterId;
  int? readAt;
  int readDuration;

  History({
    required this.id,
    required this.chapterId,
    this.readAt,
    required this.readDuration,
  });
}

class HistoryWithRelations {
  int id;
  int chapterId;
  int bookId;
  String title;
  String chapterName;
  double chapterNumber;
  int? readAt;
  int readDuration;
  BookCover coverData;

  HistoryWithRelations({
    required this.id,
    required this.chapterId,
    required this.bookId,
    required this.title,
    required this.chapterName,
    required this.chapterNumber,
    this.readAt,
    required this.readDuration,
    required this.coverData,
  });
}