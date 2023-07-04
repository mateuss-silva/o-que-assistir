import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';

final class TVSerieModel extends TVSerieEntity {
  const TVSerieModel({
    required super.id,
    required super.name,
    required super.originalName,
    required super.backdropPath,
    required super.posterPath,
    required super.genres,
    required super.overview,
    required super.popularity,
    required super.firstAirDate,
    required super.voteAverage,
    required super.voteCount,
    super.seasonCount,
  });

  factory TVSerieModel.fromJson(Map<String, dynamic> json) {
    return TVSerieModel(
      id: json['id'],
      name: json['name'],
      originalName: json['original_name'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      genres: GenderModel.fromJsonList((json['genres'] ?? []) as List),
      overview: json['overview'],
      popularity: json['popularity'],
      firstAirDate: DateTime.parse(json['first_air_date']),
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      seasonCount: (json['seasons'] as List).length,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'original_name': originalName,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'genres': genres.map((e) => e.toJson()).toList(),
      'overview': overview,
      'popularity': popularity,
      'first_air_date': firstAirDate.toIso8601String(),
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'seasons': seasonCount,
    };
  }

  static List<TVSerieModel> fromJsonList(List<dynamic> json) {
    return json.map((e) => TVSerieModel.fromJson(e)).toList();
  }
}
