

import 'package:FReader/domain/extensions/models/chapter_info.dart';
import 'package:FReader/domain/extensions/manga_info.dart';
import 'package:FReader/domain/extensions/models/commands.dart';

abstract class Source {
  late int id;
  late String name;
  late String lang;

  Future<MangaInfo> getMangaDetails(MangaInfo manga, List<Command> commands);
  Future<List<ChapterInfo>> getChapterList(MangaInfo manga, List<Command> commands);
  Future<List<String>> getPageList(ChapterInfo chapter, List<Command> commands) ;

}