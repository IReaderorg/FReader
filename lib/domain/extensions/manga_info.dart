

class MangaInfo {

  String key;
  String title;
  String artist;
  String author;
  String description;
  List<String> genres;
  int status;
  String cover;

  MangaInfo({
    required this.key,
    required this.title,
    this.artist = "",
    this.author= "",
    this.description= "",
    this.genres = const [],
    this.status = UNKNOWN,
    this.cover= "",
  });

  static const int UNKNOWN = 0;
  static const int ONGOING = 2;
  static const int COMPLETED = 3;
  static const int LICENSED = 4;
  static const int PUBLISHING_FINISHED = 5;
  static const int CANCELLED = 6;
  static const int ON_HIATUS = 7;

  MangaInfo copyWith({
    String? key,
    String? title,
    String? artist,
    String? author,
    String? description,
    List<String>? genres,
    int? status,
    String? cover,
  }) {
    return MangaInfo(
      key: key ?? this.key,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      author: author ?? this.author,
      description: description ?? this.description,
      genres: genres ?? this.genres,
      status: status ?? this.status,
      cover: cover ?? this.cover,
    );
  }
}