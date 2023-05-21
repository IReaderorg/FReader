
import 'package:FReader/domain/extensions/manga_info.dart';

class MangasPageInfo {
  List<MangaInfo> mangas;
  bool hasNextPage;

  MangasPageInfo({
    required this.mangas,
    required this.hasNextPage,
  });
}