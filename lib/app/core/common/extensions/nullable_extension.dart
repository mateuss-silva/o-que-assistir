extension Nullable on Object? {
  /// Returns true if this nullable object is null.
  bool get isNull => this == null;

  /// Returns true if this nullable object is not null.
  bool get isNotNull => this != null;
}
