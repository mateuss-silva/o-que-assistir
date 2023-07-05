abstract interface class SearchDataSource {
  Future<List> getSuggestions(String query);
}
