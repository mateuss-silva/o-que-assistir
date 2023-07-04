import 'dart:convert';

import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/tv_serie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/models/actor_model.dart';
import 'package:o_que_assistir/app/features/home/data/models/tv_serie_model.dart';
import 'package:http/http.dart' as http;

class TVSerieDataSourceImpl implements TVSerieDataSource {
  final http.Client client;

  TVSerieDataSourceImpl(this.client);

  @override
  Future<TVSerieModel> getTVSerie(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/tv/$id?api_key=$apiKey&language=$language'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return TVSerieModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TVSerieModel>> getTVSeries(
      {required TVSerieCategory category}) async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/tv/${category.value}?api_key=$apiKey&language=$language'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final movies = json.decode(response.body)['results'] as List;
      return TVSerieModel.fromJsonList(movies);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ActorModel>> getCast(int tvSerieId) async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/tv/$tvSerieId/credits?api_key=$apiKey&language=$language'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final cast = json.decode(response.body)['cast'] as List;
      return ActorModel.fromJsonList(cast);
    } else {
      throw ServerException();
    }
  }
}
