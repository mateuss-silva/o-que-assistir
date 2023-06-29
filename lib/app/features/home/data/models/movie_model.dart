import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';

final class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.homepage,
    required super.backdropPath,
    required super.posterPath,
    required super.genres,
    required super.overview,
    required super.popularity,
    required super.releaseDate,
    required super.status,
    required super.voteAverage,
    required super.voteCount,
    required super.imdbId,
  });
}
