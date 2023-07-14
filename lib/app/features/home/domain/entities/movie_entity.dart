import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/common/date.dart';
import 'package:o_que_assistir/app/core/common/percentage.dart';
import 'package:o_que_assistir/app/core/common/time.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/gender_entity.dart';
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

  final MovieCategory category;

  String get duration =>
      '${Time.hoursFromMinutes(runtime!)}h ${Time.remainingMinutes(runtime!)}m';

  String get voteAveragePercentage => Percentage.zeroToTen(voteAverage);

  String get releaseDateYear => Date.mediaYear(releaseDate);

  String get gender => GenderEntity.hasGender(genres)
      ? GenderEntity.gender(genres)
      : "Gênero desconhecido";

  String get subtitle {
    return [
      "Filme",
      originalTitle,
      voteAveragePercentage,
      releaseDateYear,
      gender,
    ].join(" ● ");
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
    required this.category,
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

  static List<MovieEntity> byCategory(
          List<MovieEntity> movies, MovieCategory category) =>
      movies.where((movie) => movie.category == category).toList();
}
