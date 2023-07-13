import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/core/common/result.dart';
import 'package:o_que_assistir/app/core/common/status_code_extension.dart';
import 'package:o_que_assistir/app/core/common/types.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/search_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/factories/media_factory.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';
import 'package:http/http.dart' as http;

class SearchDataSourceImpl implements SearchDataSource {
  final http.Client client;
  final MediaFactory mediaFactory;

  SearchDataSourceImpl(this.client, this.mediaFactory);

  @override
  Future<List> getSuggestions(String query) async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/search/multi?api_key=$apiKey&query=$query&language=$language'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode.isSuccess) {
      return mediaFromResponse(response);
    } else {
      throw ServerException();
    }
  }

  List<MediaEntity> mediaFromResponse(response) {
    return excludePersonFrom(suggestionResults(response))
        .map((e) => mediaFactory.fromType(createMedia(e)))
        .toList();
  }

  List<Json> suggestionResults(response) =>
      MultipleResult.fromResponse(response).data;

  Iterable<Json> excludePersonFrom(List<Json> data) {
    return data.where((data) => !typeIsPerson(createMedia(data)));
  }

  bool typeIsPerson(MediaResult media) => media.type.isPerson;

  MediaResult createMedia(Json data) {
    return (type: MediaType.fromString(data['media_type']), data: data);
  }
}
