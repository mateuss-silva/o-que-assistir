import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/tv_serie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';

abstract interface class TVSerieRepository {
  Future<Either<Failure, List<TVSerieEntity>>> getTVSeries(
      {required TVSerieCategory category});

  Future<Either<Failure, TVSerieEntity>> getTVSerie(int id);
}
