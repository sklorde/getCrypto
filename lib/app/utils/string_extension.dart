import 'package:diacritic/diacritic.dart';

extension StringExtension on String {
  toURL() {
    return this.toLowerCase().replaceAll(' ', '-');
  }

  toCompare() {
    return removeDiacritics(this.toLowerCase());
  }
}
