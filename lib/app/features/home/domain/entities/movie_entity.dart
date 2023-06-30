import 'package:o_que_assistir/app/core/entities/entity.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';

base class MovieEntity extends Entity {
  final String title;
  final String originalTitle;
  final Uri homepage;
  final String backdropPath;
  final String posterPath;
  final List<GenderModel> genres;
  final String overview;
  final String status;
  final DateTime releaseDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final String imdbId;
  final int runtime;

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
    required this.runtime,
  });

  String movieDuration() {
    final hours = runtime ~/ 60;
    final minutes = runtime % 60;
    return '${hours}h ${minutes}m';
  }
}
