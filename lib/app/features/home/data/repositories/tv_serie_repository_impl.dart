import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/tv_serie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/cast_repository.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/tv_serie_repository.dart';

class TVSerieRepositoryImpl implements TVSerieRepository, CastRepository {
  final TVSerieDataSource datasource;

  TVSerieRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, TVSerieEntity>> getTVSerie(int id) async {
    try {
      return Right(await datasource.getTVSerie(id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TVSerieEntity>>> getTVSeries({
    required TVSerieCategory category,
  }) async {
    try {
      return Right(await datasource.getTVSeries(category: category));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ActorEntity>>> getCast(int tvSerieId) async {
    try {
      return Right(await datasource.getCast(tvSerieId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
