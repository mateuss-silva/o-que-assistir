import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, MovieEntity>> getMovie(int id);
}
