extension StringExtensions on String? {
  String get getValueOrDefault {
    return this ?? "";
  }
}
