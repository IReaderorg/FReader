
import 'dart:io';

import 'package:FReader/domain/extensions/models/chapter_info.dart';
import 'package:FReader/domain/extensions/manga_info.dart';
import 'package:FReader/domain/extensions/models/filters.dart';
import 'package:FReader/domain/extensions/models/listing.dart';

import 'catalog_source.dart';
import 'models/commands.dart';
import 'models/manga_page_info.dart';

class TestSource extends CatalogSource {
  @override
  final int id = 1;

  @override
  final String name = 'Test source';

  @override
  String get lang => 'en';

  @override
  Future<MangaInfo> getMangaDetails(MangaInfo manga,
      List<Command<dynamic>> commands) async {
    sleep(Duration(milliseconds: 1000));
    const noHipstersOffset = 10;
    final picId = int.parse(manga.title.split(' ')[1]) + noHipstersOffset;
    return manga.copyWith(cover: 'https://picsum.photos/300/400/?image=$picId');
  }

  @override
  Future<MangasPageInfo> getMangaListByListing(Listing? sort, int page) async {
    sleep(Duration(milliseconds: 1000));
    return MangasPageInfo(hasNextPage: true, mangas: getTestManga(page));
  }

  @override
  Future<MangasPageInfo> getMangaList(List<Filter<dynamic>> filters,
      int page) async {
    var mangaList = getTestManga(page);

    for (final filter in filters) {
      if (filter is Title) {
        mangaList =
            mangaList.where((manga) => manga.title.contains(filter.value))
                .toList();
      }
    }

    return MangasPageInfo(mangas: mangaList,hasNextPage:  true);
  }

  @override
  Future<List<ChapterInfo>> getChapterList(MangaInfo manga,
      List<Command<dynamic>> commands) async {
    sleep(Duration(milliseconds: 1000));
    return getTestChapters();
  }

  @override
  Future<List<String>> getPageList(ChapterInfo chapter,
      List<Command<dynamic>> commands) async {
    sleep(Duration(milliseconds: 1000));
    if (chapter.key == '4') {
      return [
            'https://storage.googleapis.com/exoplayer-test-media-1/mp4/dizzy-with-tx3g.mp4'
      ];
    }
    return getTestPages();
  }

  @override
  List<Listing> getListings() {
    return [Latest()];
  }

  @override
  List<Filter> getFilters() {
    return [
      Title(),
      Author(),
      Artist(),
      Group("Genres", getGenreList()),
    ];
  }

  @override
  List<Command> getCommands() {
    return [
      CommandChapterNote('NOTE:Only the first value would be used'),
      CommandChapterText('Title'),
      CommandChapterSelect(
        'Options',
        ['None', 'Last 10 Chapter'],
      ),
    ];
  }

  List<Genre> getGenreList() {
    return [
      Genre('4-koma'),
      Genre('Action'),
      Genre('Adventure'),
      Genre('Award Winning'),
      Genre('Comedy'),
      Genre('Cooking'),
      Genre('Doujinshi'),
      Genre('Drama'),
      Genre('Ecchi'),
      Genre('Fantasy'),
      Genre('Gender Bender'),
      Genre('Harem'),
      Genre('Historical'),
      Genre('Horror'),
      Genre('Josei'),
      Genre('Martial Arts'),
      Genre('Mecha'),
      Genre('Medical'),
      Genre('Music'),
      Genre('Mystery'),
      Genre('Oneshot')];
  }
  List<MangaInfo> getTestManga(int page) {
    final list = <MangaInfo>[];
    final id = (page - 1) * 20 + 1;
    final manga1 = MangaInfo(
      key: '$id',
      title: 'Manga $id',
      artist: 'Artist $id',
      author: 'Author $id',
      description: 'Lorem ipsum',
      genres: ['Foo', 'Bar'],
      status: 0,
      cover: '',
    );
    list.add(manga1);

    for (var i = 1; i <= 19; i++) {
      list.add(manga1.copyWith(key: '${id + i}', title: 'Manga ${id + i}'));
    }

    return list;
  }

  List<ChapterInfo> getTestChapters() {
    final chapter1 = ChapterInfo(
      key: '1',
      name: 'Chapter 1',
      dateUpload: DateTime.now().millisecondsSinceEpoch,
    );
    final chapter2 = chapter1.copyWith(key: '2', name: 'Chapter2');
    final chapter3 = chapter1.copyWith(key: '3', name: 'Chapter3');
    final chapter4 = chapter1.copyWith(key: '4', name: 'Chapter4', type: ChapterInfo.MOVIE);

    return [chapter1, chapter2, chapter3, chapter4];
  }
  List<String> getTestPages() {
    final pages = <String>[];

    for (var i = 1; i <= 3; i++) {
      pages.add('https://picsum.photos/300/400/?image=1');
    }

    ipsum.split(',').map((it) {
      pages.add(it);
    });

    return pages;
  }
  final ipsum = """
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget rutrum nisl, vitae ullamcorper velit. In eu diam justo. Sed placerat, risus at luctus vestibulum, nisl nunc lobortis est, eu viverra sapien nulla at metus. Proin lacinia felis tortor. Nullam quis dignissim lorem. Morbi vel tristique mi. Phasellus eget tellus dui. Maecenas sollicitudin in neque vel porta. Nam vel nulla at lectus fringilla fringilla mollis at metus. Duis elit nulla, viverra gravida ullamcorper sit amet, sagittis vitae eros. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin sodales vehicula mi, id laoreet elit dapibus in. Morbi tristique velit a velit pellentesque aliquam. Etiam tempus venenatis blandit.

  Nullam ac ornare sapien, in blandit risus. Ut nec lectus ac massa ultricies commodo nec ut enim. Morbi aliquet dapibus aliquet. Vestibulum feugiat, eros vel elementum condimentum, justo ex ultrices mi, ut mollis elit tortor et est. Morbi pulvinar ante sit amet ante mattis placerat. Etiam vulputate arcu id magna vestibulum interdum. Quisque aliquam non dui finibus luctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean dictum sapien non arcu porta, quis auctor tortor lacinia. Phasellus id tellus eget nisi pellentesque lacinia. Donec vitae arcu ut magna sollicitudin hendrerit sit amet ut tellus. Mauris tincidunt, quam quis imperdiet ultrices, lacus augue molestie est, eget condimentum felis augue eleifend mi. In in aliquam ex. Vestibulum tristique ornare neque, vitae ultrices metus luctus vitae. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed vitae eros interdum, pulvinar turpis at, pharetra nulla.

  Nulla vitae egestas nisl, at pharetra arcu. Praesent vulputate congue mauris, blandit venenatis sapien porttitor sit amet. Etiam pretium ex at diam pulvinar aliquet. Nunc ornare, quam sit amet malesuada lobortis, metus ligula eleifend nisi, vel pulvinar arcu mauris non sem. Pellentesque pretium nisi dui, et faucibus odio interdum sit amet. Praesent quis sem nunc. Quisque convallis ornare mauris id maximus. Phasellus facilisis sem posuere iaculis imperdiet. Curabitur viverra eleifend arcu at mattis. Pellentesque sollicitudin metus erat, eu tincidunt eros porta a. Fusce consequat porta nulla.

  Aenean egestas blandit erat, et lobortis dui eleifend nec. Integer dapibus nunc mattis nisi vestibulum tempus. Quisque aliquam ante sit amet eros aliquam, in cursus neque ultricies. Phasellus egestas nulla nec lorem dictum efficitur. Ut vehicula metus id vehicula tempor. Proin interdum mollis lectus, et posuere lorem. Integer vitae sodales justo. Nam finibus quis ante a dapibus. Nullam mattis eleifend leo, nec venenatis leo sagittis vitae. Duis dictum semper varius. Maecenas mollis maximus eros, sit amet dictum enim pharetra et. Sed eget neque at diam accumsan imperdiet cursus vel tellus. Curabitur vel luctus nulla, id aliquet mauris.

  Pellentesque consequat metus felis, sit amet commodo sapien vestibulum et. Curabitur velit dolor, lacinia et interdum in, viverra ut ante. Curabitur malesuada odio et condimentum mattis. Sed aliquam leo dui, eu fringilla mi laoreet in. Donec at justo id sem egestas dictum eget aliquet ex. Curabitur iaculis facilisis nisl, at efficitur est tincidunt a. Maecenas ullamcorper sapien vel pulvinar posuere. Aenean molestie at quam in convallis. Praesent vitae odio mauris. Suspendisse metus urna, congue ut orci laoreet, feugiat vestibulum ipsum.
    """.trim();
}


class Latest extends Listing {
  Latest({super.name = "Latest"});
}