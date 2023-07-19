extension ListExtension<T> on List<T>? {
  List<T> get getValueOrDefault => this ?? [];
  int get itemCount => this?.length ?? 0;
  bool get isNullOrEmpty => this == null || (this ?? []).isEmpty;
  bool get isNotEmpty => !isNullOrEmpty;
}
