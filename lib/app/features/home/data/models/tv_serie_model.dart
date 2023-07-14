import 'package:o_que_assistir/app/core/common/types.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/tv_serie_data_source.dart';
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
    required super.category,
    super.seasonCount,
  });

  factory TVSerieModel.fromJson(Json json) {
    return TVSerieModel(
      id: json['id'].toString(),
      name: json['name'],
      originalName: json['original_name'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      genres: GenderModel.fromJsonList((json['genres'] ?? []) as List),
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      firstAirDate: DateTime.tryParse(json['first_air_date']),
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
      seasonCount: (json['seasons'] as List?)?.length,
      category: TVSerieCategory.any,
    );
  }

  factory TVSerieModel.fromJsonWithCategory(
      Json json, TVSerieCategory category) {
    return TVSerieModel.fromJson(json).copyWithCategory(category);
  }

  Json toJson() {
    return {
      'id': id,
      'name': name,
      'original_name': originalName,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'genres': genres.map((e) => e.toJson()).toList(),
      'overview': overview,
      'popularity': popularity,
      'first_air_date': firstAirDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'seasons': seasonCount,
    };
  }

  TVSerieModel copyWithCategory(TVSerieCategory category) {
    return TVSerieModel(
      id: id,
      name: name,
      originalName: originalName,
      backdropPath: backdropPath,
      posterPath: posterPath,
      genres: genres,
      overview: overview,
      popularity: popularity,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      seasonCount: seasonCount,
      category: category,
    );
  }

  static List<TVSerieModel> fromJsonList(
    List<dynamic> list, {
    TVSerieCategory category = TVSerieCategory.any,
  }) {
    return list
        .map((e) => TVSerieModel.fromJsonWithCategory(e, category))
        .toList();
  }
}
