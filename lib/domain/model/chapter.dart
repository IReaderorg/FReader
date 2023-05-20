

import 'package:FReader/domain/model/book.dart';
import 'package:FReader/domain/repository/Splittor.dart';
import 'package:FReader/domain/repository/chapter_repository.dart';

class Chapter {
  int id;
  int bookId;
  String key;
  String name;
  bool read;
  bool bookmark;
  int dateUpload;
  int dateFetch;
  int sourceOrder;
  List<String> content;
  double number;
  String translator;
  int lastPageRead;
  int type;

  Chapter({
    required this.id,
    required this.bookId,
    required this.key,
    required this.name,
     this.read = false,
     this.bookmark= false,
     this.dateUpload = 0,
     this.dateFetch= 0,
     this.sourceOrder= 0,
     this.content = const [],
     this.number= -1,
     this.translator = "",
     this.lastPageRead= 0,
     this.type = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      ChapterRepository.columnId: this.id,
      ChapterRepository.bookId: this.bookId,
      ChapterRepository.url: this.key,
      ChapterRepository.name: this.name,
      ChapterRepository.read: convertToDB(this.read),
      ChapterRepository.bookmark: convertToDB(this.bookmark),
      ChapterRepository.dateUpload: this.dateUpload,
      ChapterRepository.dateFetch: this.dateFetch,
      ChapterRepository.sourceOrder: this.sourceOrder,
      ChapterRepository.content: this.content.join(GLOBAL_DB_SPLITTOR),
      ChapterRepository.chapterNumber: this.number,
      ChapterRepository.scanlator: this.translator,
      ChapterRepository.lastPageRead: this.lastPageRead,
      ChapterRepository.type: this.type,
    };
  }

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      id: map[ChapterRepository.columnId] as int,
      bookId: map[ChapterRepository.columnId] as int,
      key: map[ChapterRepository.url] as String,
      name: map[ChapterRepository.name] as String,
      read: convertFromDB(map[ChapterRepository.read] as int),
      bookmark: convertFromDB(map[ChapterRepository.bookmark] as int),
      dateUpload: map[ChapterRepository.dateUpload] as int,
      dateFetch: map[ChapterRepository.dateFetch] as int,
      sourceOrder: map[ChapterRepository.sourceOrder] as int,
      content: (map[ChapterRepository.content] as String).split(GLOBAL_DB_SPLITTOR),
      number: map[ChapterRepository.chapterNumber] as double,
      translator: map[ChapterRepository.scanlator] as String,
      lastPageRead: map[ChapterRepository.lastPageRead] as int,
      type: map[ChapterRepository.type] as int,
    );
  }
}