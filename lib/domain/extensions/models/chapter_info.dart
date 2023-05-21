

class ChapterInfo {
  String key;
  String name;
  int dateUpload;
  double number;
  String scanlator;
  int type;

  ChapterInfo({
    required this.key,
    required this.name,
    this.dateUpload = 0,
    this.number = -1,
    this.scanlator = "",
    this.type = MIX,
  });

  static const int MIX = 0;
  static const int NOVEL = 2;
  static const int MUSIC = 3;
  static const int MANGA = 4;
  static const int MOVIE = 5;

  ChapterInfo copyWith({
    String? key,
    String? name,
    int? dateUpload,
    double? number,
    String? scanlator,
    int? type,
  }) {
    return ChapterInfo(
      key: key ?? this.key,
      name: name ?? this.name,
      dateUpload: dateUpload ?? this.dateUpload,
      number: number ?? this.number,
      scanlator: scanlator ?? this.scanlator,
      type: type ?? this.type,
    );
  }
}