import 'package:o_que_assistir/app/core/common/types.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';

final class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.backdropPath,
    required super.posterPath,
    required super.genres,
    required super.overview,
    required super.popularity,
    required super.releaseDate,
    required super.status,
    required super.voteAverage,
    required super.voteCount,
    required super.runtime,
    required super.category,
  });

  factory MovieModel.fromJson(Json json) {
    return MovieModel(
      id: json['id'].toString(),
      title: json['title'],
      originalTitle: json['original_title'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      genres: GenderModel.fromJsonList((json['genres'] ?? []) as List),
      overview: json['overview'],
      popularity: json['popularity'],
      releaseDate: DateTime.tryParse(json['release_date']),
      status: json['status'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
      runtime: json['runtime'],
      category: MovieCategory.any,
    );
  }

  factory MovieModel.fromJsonWithCategory(Json json, MovieCategory category) {
    return MovieModel.fromJson(json).copyWithCategory(category);
  }

  Json toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'backdrop_path': backdropPath,
      'poster_path': posterPath,
      'genres': genres.map((e) => e.toJson()).toList(),
      'overview': overview,
      'popularity': popularity,
      'release_date': releaseDate,
      'status': status,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'runtime': runtime,
    };
  }

  MovieModel copyWithCategory(MovieCategory category) {
    return MovieModel(
      id: id,
      title: title,
      originalTitle: originalTitle,
      backdropPath: backdropPath,
      posterPath: posterPath,
      genres: genres,
      overview: overview,
      popularity: popularity,
      releaseDate: releaseDate,
      status: status,
      voteAverage: voteAverage,
      voteCount: voteCount,
      runtime: runtime,
      category: category,
    );
  }

  static List<MovieModel> fromJsonList(
    List list, {
    MovieCategory category = MovieCategory.any,
  }) {
    return list
        .map((item) => MovieModel.fromJsonWithCategory(item, category))
        .toList();
  }
}
