abstract class Command<V> {
  final String name;
  final V initialValue;
  late V value;

  Command(this.name, this.initialValue) {
    value = initialValue;
  }

  bool isDefaultValue() {
    return value == initialValue;
  }
}

class Fetchers extends Command<String> {
  final String url;
  final String html;

  Fetchers({required this.url, required this.html})
      : super(url, html);
}

class DetailFetch extends Fetchers {
  DetailFetch({String url = '', String html = ''})
      : super(url: url, html: html);
}

class ContentFetch extends Fetchers {
  ContentFetch({String url = '', String html = ''})
      : super(url: url, html: html);
}

class ExploreFetch extends Fetchers {
  ExploreFetch({String url = '', String html = ''})
      : super(url: url, html: html);
}

class CommandNote extends Command<void> {
  CommandNote(String name) : super(name, null);
}

class CommandText extends Command<String> {
  CommandText(String name, {String value = ''})
      : super(name, value);
}

class CommandSelect extends Command<int> {
  final List<String> options;

  CommandSelect(String name, this.options, {int value = 0})
      : super(name, value);
}

class ChapterFetch extends Fetchers {
  ChapterFetch({String url = '', String html = ''})
      : super(url: url, html: html);
}

class CommandDetailFetch extends DetailFetch {
  CommandDetailFetch({String url = '', String html = ''})
      : super(url: url, html: html);
}

class CommandContentFetch extends ContentFetch {
  CommandContentFetch({String url = '', String html = ''})
      : super(url: url, html: html);
}

class CommandExploreFetch extends ExploreFetch {
  CommandExploreFetch({String url = '', String html = ''})
      : super(url: url, html: html);
}

class CommandChapterNote extends CommandNote {
  CommandChapterNote(String name) : super(name);
}

class CommandChapterText extends CommandText {
  CommandChapterText(String name, {String value = ''})
      : super(name, value: value);
}

class CommandChapterSelect extends CommandSelect {
  CommandChapterSelect(String name, List<String> options, {int value = 0})
      : super(name, options, value: value);
}

class CommandChapterFetch extends ChapterFetch {
  CommandChapterFetch({String url = '', String html = ''})
      : super(url: url, html: html);
}