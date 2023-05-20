
import 'package:FReader/domain/repository/book_repository.dart';

class Book {
  int? id;
  int sourceId;
  String title;
  String key;
  String author = "";
  String description = "";
  List<String> genres = [];
  int status = 0;
  String cover = "";
  String customCover = "";
  bool favorite = false;
  int lastUpdate = 0;
  bool initialized = false;
  int dateAdded = 0;
  int viewer = 0;
  int flags = 0;

//<editor-fold desc="Data Methods">
  Book({
    this.id,
    required this.sourceId,
    required this.title,
    required this.key,
    this.author = "",
    required this.description,
    this.genres = const [],
    this.status = 0,
    this.cover = "",
    this.customCover = "",
    this.favorite = false,
    this.lastUpdate = 0,
    this.initialized = false,
    this.dateAdded = 0,
    this.viewer = 0,
    this.flags = 0,
  });




  Book copyWith({
    int? id,
    int? sourceId,
    String? title,
    String? key,
    String? author,
    String? description,
    List<String>? genres,
    int? status,
    String? cover,
    String? customCover,
    bool? favorite,
    int? lastUpdate,
    bool? initialized,
    int? dateAdded,
    int? viewer,
    int? flags,
  }) {
    return Book(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      title: title ?? this.title,
      key: key ?? this.key,
      author: author ?? this.author,
      description: description ?? this.description,
      genres: genres ?? this.genres,
      status: status ?? this.status,
      cover: cover ?? this.cover,
      customCover: customCover ?? this.customCover,
      favorite: favorite ?? this.favorite,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      initialized: initialized ?? this.initialized,
      dateAdded: dateAdded ?? this.dateAdded,
      viewer: viewer ?? this.viewer,
      flags: flags ?? this.flags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      BookRepository.columnId: this.id,
      BookRepository.source: this.sourceId,
      BookRepository.title: this.title,
      BookRepository.url: this.key,
      BookRepository.author: this.author,
      BookRepository.description: this.description,
      BookRepository.genre: _convertToString(this.genres),
      BookRepository.status: this.status,
      BookRepository.thumbnailUrl: this.cover,
      BookRepository.favorite: convertToDB(this.favorite),
      BookRepository.lastUpdate: this.lastUpdate,
      BookRepository.initialized: convertToDB(this.initialized),
      BookRepository.dateAdded: this.dateAdded,
      BookRepository.viewer: this.viewer,
      BookRepository.chapterFlags: this.flags,
      BookRepository.coverLastModified: 0,
    };
  }

  String _convertToString(List<String> genres) {
    return genres.join('##,');
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map[BookRepository.columnId] as int,
      sourceId: map[BookRepository.source] as int,
      title: map[BookRepository.title] as String,
      key: map[BookRepository.url] as String,
      author: map[BookRepository.author] as String,
      description: map[BookRepository.description] as String,
      genres: (map[BookRepository.genre] as String).split("##,"),
      status: map[BookRepository.status] as int,
      cover: map[BookRepository.thumbnailUrl] as String,
      favorite: convertFromDB(map[BookRepository.favorite] as int),
      lastUpdate: map[BookRepository.lastUpdate] as int,
      initialized: convertFromDB(map[BookRepository.initialized] as int),
      dateAdded: map[BookRepository.dateAdded] as int,
      viewer: map[BookRepository.viewer] as int,
      flags: map[BookRepository.chapterFlags] as int,

    );
  }

//</editor-fold>
}
Book createBook(int sourceId, String title, String key) {
  return Book(sourceId: sourceId, title: title, key: key, author: "", description: "", genres: [], status: 0, cover: "", customCover: "", favorite: false, lastUpdate: 0, initialized: false, dateAdded: 0, viewer: 0, flags: 0);
}
String convertToDB(bool value) {
  if(value) {
    return "1";
  } else {
    return "0";
  }
}
bool convertFromDB(int value) {
  return value == 1;
}