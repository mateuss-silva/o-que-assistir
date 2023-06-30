import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource repository;

  MovieRepositoryImpl(this.repository);

  @override
  Future<Either<Failure, MovieEntity>> getMovie(int id) async {
    try {
      return Right(await repository.getMovie(id));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
