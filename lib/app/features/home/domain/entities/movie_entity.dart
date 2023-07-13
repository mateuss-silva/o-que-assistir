import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';

base class MovieEntity extends MediaEntity {
  final String title;
  final String originalTitle;
  final String? backdropPath;
  final String? posterPath;
  final List<GenderModel> genres;
  final String overview;
  final DateTime? releaseDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  final int? runtime;
  final String? status;

  String get movieDuration {
    int hoursFromMinutes(int minutes) => minutes ~/ 60;
    int remainingMinutes(int minutes) => minutes % 60;

    if (runtime == null) return 'N/A';

    return '${hoursFromMinutes(runtime!)}h ${remainingMinutes(runtime!)}m';
  }

  const MovieEntity({
    required super.id,
    required this.title,
    required this.originalTitle,
    required this.backdropPath,
    required this.posterPath,
    required this.genres,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.status,
    required this.voteAverage,
    required this.voteCount,
    required this.runtime,
    super.type = MediaType.movie,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        originalTitle,
        backdropPath,
        posterPath,
        genres,
        overview,
        popularity,
        releaseDate,
        status,
        voteAverage,
        voteCount,
        runtime,
      ];
}
