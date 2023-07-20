extension StringExtensions on String? {
  String get getValueOrDefault {
    return this ?? "";
  }

  String toImage({required double height, required double width, required double quality}) {
    return getValueOrDefault.replaceAll("{size}", "${(height * quality).toInt()}/${(width * quality).toInt()}/");
  }
}
