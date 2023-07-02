import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';

import '../../data/datasources/movie_data_source.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovies(
      {required MovieCategory category});

  Future<Either<Failure, MovieEntity>> getMovie(int id);

  Future<Either<Failure, List<ActorEntity>>> getCast(int movieId);
}
