import 'dart:convert';

import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/search_data_source.dart';
// http
import 'package:http/http.dart' as http;
import 'package:o_que_assistir/app/features/home/data/models/movie_model.dart';
import 'package:o_que_assistir/app/features/home/data/models/tv_serie_model.dart';

class SearchDataSourceImpl implements SearchDataSource {
  final http.Client client;

  SearchDataSourceImpl(this.client);

  @override
  Future<List> getSuggestions(String query) async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/search/multi?api_key=$apiKey&query=$query&language=$language'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var results = json.decode(response.body)['results'] as List;

      results.removeWhere((element) => element['media_type'] == 'person');

      results = results
          .map((e) => e['media_type'] == 'tv'
              ? TVSerieModel.fromJson(e)
              : MovieModel.fromJson(e))
          .toList();

      return results;
    } else {
      throw ServerException();
    }
  }
}
