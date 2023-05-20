

class UpdatesWithRelations {
  int bookId;
  String bookTitle;
  int chapterId;
  String chapterName;
  String? scanlator;
  bool read;
  bool bookmark;
  int sourceId;
  int dateFetch;
  BookCover coverData;
  bool downloaded;

  UpdatesWithRelations({
    required this.bookId,
    required this.bookTitle,
    required this.chapterId,
    required this.chapterName,
    this.scanlator,
    required this.read,
    required this.bookmark,
    required this.sourceId,
    required this.dateFetch,
    required this.coverData,
    required this.downloaded,
  });
}

class BookCover {
  int bookId;
  int sourceId;
  String? cover;
  bool favorite;
  int lastModified;

  BookCover({
    required this.bookId,
    required this.sourceId,
    this.cover,
    required this.favorite,
    this.lastModified = 0,
  });
}

class Update {
  int id;
  int chapterId;
  int bookId;
  int date;

  Update({
    this.id = 0,
    required this.chapterId,
    required this.bookId,
    required this.date,
  });
}