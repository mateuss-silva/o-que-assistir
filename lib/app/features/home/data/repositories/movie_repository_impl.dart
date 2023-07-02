import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, MovieEntity>> getMovie(int id) async {
    try {
      return Right(await datasource.getMovie(id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies({
    required MovieCategory category,
  }) async {
    try {
      return Right(await datasource.getMovies(category: category));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ActorEntity>>> getCast(int movieId) async {
    try {
      return Right(await datasource.getCast(movieId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
