import 'dart:convert';

import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client client;

  MovieDataSourceImpl(this.client);

  @override
  Future<MovieModel> getMovie(int id) async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/$id?api_key=$apiKey&language=$language'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/popular?api_key=$apiKey&language=$language'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final movies = json.decode(response.body)['results'] as List;
      return movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw ServerException();
    }
  }
}
