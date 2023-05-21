
/**
 * The list of filters a catalog can implement. New types of filters can be implemented through
 * inheritance, but they must inherit from one of the known (base) filters.
 *
 * All catalogs should implement the common filters, because those will also be used by Tachiyomi
 * when performing a global search.
 */
abstract class Filter<V> {
  final String name;
  final V initialValue;
  late V value;

  Filter(this.name, this.initialValue) {
    value = initialValue;
  }

  bool isDefaultValue() {
    return initialValue == value;
  }
}

/**
 * Base filters.
 */

class Note extends Filter<void> {
  Note(String name) : super(name, null);
}

class Text extends Filter<String> {
  Text(String name, {String value = ''}) : super(name, value);
}

class Check extends Filter<bool?> {
  final bool allowsExclusion;

  Check(String name, {this.allowsExclusion = false, bool? value})
      : super(name, value);
}

class Select extends Filter<int> {
  final List<String> options;

  Select(String name, this.options, {int value = 0}) : super(name, value);
}

class Group extends Filter<void> {
  final List<Filter> filters;

  Group(String name, this.filters) : super(name, null);
}

class Sort extends Filter<SortSelection?> {
  final List<String> options;

  Sort(String name, this.options, {SortSelection? value}) : super(name, value);


}
class SortSelection {
  final int index;
  final bool ascending;

  SortSelection(this.index, this.ascending);
}
/**
 * Common filters.
 */

class Title extends Text {
  Title({String name = 'Title'}) : super(name);
}

class Author extends Text {
  Author({String name = 'Author'}) : super(name);
}

class Artist extends Text {
  Artist({String name = 'Artist'}) : super(name);
}

class Genre extends Check {
  Genre(String name, {bool allowsExclusion = false})
      : super(name, allowsExclusion: allowsExclusion);
}