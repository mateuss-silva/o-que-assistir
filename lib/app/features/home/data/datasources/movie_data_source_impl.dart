import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/core/common/result.dart';
import 'package:o_que_assistir/app/core/common/status_code_extension.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/models/actor_model.dart';
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

    if (response.statusCode.isSuccess) {
      return MovieModel.fromJson(SingleResult.fromResponse(response).data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovies({required MovieCategory category}) async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/movie/${category.value}?api_key=$apiKey&language=$language'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode.isSuccess) {
      return moviesFromResults(MultipleResult.fromResponse(response).data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ActorModel>> getCast(int movieId) async {
    final response = await client.get(
      Uri.parse(
          '$baseUrl/movie/$movieId/credits?api_key=$apiKey&language=$language'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode.isSuccess) {
      return castFromResults(CastResult.fromResponse(response).data);
    } else {
      throw ServerException();
    }
  }

  moviesFromResults(data) => MovieModel.fromJsonList(data);

  castFromResults(data) => ActorModel.fromJsonList(data);
}
