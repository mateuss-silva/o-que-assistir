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
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'].toString(),
      title: json['title'],
      originalTitle: json['original_title'],
      backdropPath: json['backdrop_path'],
      posterPath: json['poster_path'],
      genres: GenderModel.fromJsonList((json['genres'] ?? []) as List),
      overview: json['overview'],
      popularity: json['popularity'],
      releaseDate: DateTime.parse(json['release_date']),
      status: json['status'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
      runtime: json['runtime'],
    );
  }

  Map<String, dynamic> toJson() {
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

  static List<MovieModel> fromJsonList(List list) {
    return list.map((item) => MovieModel.fromJson(item)).toList();
  }
}
