extension StatusCode on int {
  static const int success = 200;
  static const int created = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int serviceUnavailable = 503;

  bool get isSuccess => this == success || this == created;

  bool get isBadRequest =>
      this == badRequest ||
      this == unauthorized ||
      this == forbidden ||
      this == notFound;

  bool get isServerError =>
      this == internalServerError || this == serviceUnavailable;
}
