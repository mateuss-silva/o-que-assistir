import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/core/common/result.dart';
import 'package:o_que_assistir/app/core/common/status_code_extension.dart';
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

    if (response.statusCode.isSuccess) {
      return TVSerieModel.fromJson(SingleResult.fromResponse(response).data);
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

    if (response.statusCode.isSuccess) {
      return tvSeriesFromResults(
          MultipleResult.fromResponse(response).data, category);
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

    if (response.statusCode.isSuccess) {
      return castFromResults(CastResult.fromResponse(response).data);
    } else {
      throw ServerException();
    }
  }

  tvSeriesFromResults(data, category) =>
      TVSerieModel.fromJsonList(data, category: category);

  castFromResults(data) => ActorModel.fromJsonList(data);
}
