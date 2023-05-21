

import 'package:FReader/domain/extensions/models/commands.dart';
import 'package:FReader/domain/extensions/models/filters.dart';
import 'package:FReader/domain/extensions/models/listing.dart';
import 'package:FReader/domain/extensions/models/manga_page_info.dart';
import 'package:FReader/domain/extensions/source.dart';

abstract class CatalogSource extends Source {
  static const  TYPE_NOVEL = 0;
  static  const  TYPE_MANGA = 1;
  static const  TYPE_MOVIE = 2;

  Future<MangasPageInfo> getMangaList(List<Filter> filters ,int page);
  Future<MangasPageInfo> getMangaListByListing(Listing? sort ,int page);

  List<Listing> getListings()=> [];
  List<Filter> getFilters()=> [];
  List<Command> getCommands() => [];
}