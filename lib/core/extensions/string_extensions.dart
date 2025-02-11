import 'dart:math';

extension NullableStringExtensions on String? {
  bool get isNotNullAndNotEmpty {
    final value = this;

    if (value != null && value.isNotEmpty) {
      return true;
    }

    return false;
  }
}

extension StringExtensions on String {
  String splitLangCodeFromLocale() {
    return split('_').first;
  }
}

extension FileSizeIntoKB on String {
  String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}

extension StringMakeFirstCap on String {
  String makeFirstCapital() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

String getLanguageName(String languageCode) {
  switch (languageCode) {
    case 'uz':
      return 'O’zbek';
    case 'ru':
      return 'Русский';
    case 'en':
      return 'English';
    default:
      return 'Русский';
  }
}

String getLanguageCode(String languageCode) {
  switch (languageCode) {
    case 'O’zbek':
      return 'uz';
    case 'Русский':
      return 'ru';
    case 'English':
      return 'en';
    default:
      return 'ru';
  }
}

// extension HumanReadableDate on DateTime? {
//   String get humanReadable {
//     // Ensure dateToFormat is never null
//     final dateToFormat = this ?? DateTime(2024);
//     // Format the date using the specified format
//     return DateFormat('dd-MMMM-yyyy').format(this ?? DateTime(2024));
//   }
// }
