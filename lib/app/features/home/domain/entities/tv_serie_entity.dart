import 'package:o_que_assistir/app/core/entities/entity.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';

base class TVSerieEntity extends Entity {
  final String name;
  final String originalName;
  final String? backdropPath;
  final String? posterPath;
  final List<GenderModel> genres;
  final String overview;
  final DateTime? firstAirDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  final int? seasonCount;

  String get seasons => seasonCount == null
      ? ""
      : seasonCount == 1
          ? "$seasonCount temporada"
          : "$seasonCount temporadas";

  const TVSerieEntity({
    required super.id,
    required this.name,
    required this.originalName,
    required this.backdropPath,
    required this.posterPath,
    required this.genres,
    required this.overview,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    this.seasonCount,
  });
}
