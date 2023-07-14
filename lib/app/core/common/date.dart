class Date {
  static String mediaYear(DateTime? date) {
    return date?.year != null ? date!.year.toString() : "????";
  }
}
