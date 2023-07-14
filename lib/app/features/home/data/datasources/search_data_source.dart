import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';

abstract interface class SearchDataSource {
  Future<List<MediaEntity>> getSuggestions(String query);
}
