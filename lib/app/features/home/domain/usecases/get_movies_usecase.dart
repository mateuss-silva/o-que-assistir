import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/movie_repository.dart';

class GetMoviesUsecase implements Usecase<List<MovieEntity>, GetMoviesParams> {
  final MovieRepository repository;

  GetMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(GetMoviesParams params) {
    return repository.getMovies(category: params.category);
  }
}

final class GetMoviesParams extends BaseParams {
  final MovieCategory category;

  GetMoviesParams(this.category);

  @override
  List<Object?> get props => [category];
}
