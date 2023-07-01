
import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/movie_repository.dart';

class GetMoviesUsecase implements Usecase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) {
    return repository.getMovies();
  }
}