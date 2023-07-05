extension StringExtension on String {
  String get imageUrl => "https://image.tmdb.org/t/p/w500$this";
}

extension NullableStringExtension on String? {
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
}
