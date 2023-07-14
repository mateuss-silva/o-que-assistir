import 'package:o_que_assistir/app/core/common/extensions/nullable_extension.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/tv_serie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';

base class TVSerieEntity extends MediaEntity {
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
  final TVSerieCategory category;

  String get seasons => seasonCount.isNull
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
    required this.category,
    this.seasonCount,
    super.type = MediaType.tv,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        originalName,
        backdropPath,
        posterPath,
        genres,
        overview,
        popularity,
        firstAirDate,
        voteAverage,
        voteCount,
        seasonCount,
      ];

  static List<TVSerieEntity> byCategory(
          List<TVSerieEntity> tvSeries, TVSerieCategory category) =>
      tvSeries.where((tv) => tv.category == category).toList();
}
