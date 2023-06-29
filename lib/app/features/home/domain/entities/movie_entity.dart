import 'package:o_que_assistir/app/core/entities/entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/gender_entity.dart';

base class MovieEntity extends Entity {
  final String title;
  final String originalTitle;
  final Uri homepage;
  final String backdropPath;
  final String posterPath;
  final List<GenderEntity> genres;
  final String overview;
  final String status; // todo enum
  final DateTime releaseDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final String imdbId;

  const MovieEntity({
    required super.id,
    required this.title,
    required this.originalTitle,
    required this.homepage,
    required this.backdropPath,
    required this.posterPath,
    required this.genres,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.status,
    required this.voteAverage,
    required this.voteCount,
    required this.imdbId,
  });
}
