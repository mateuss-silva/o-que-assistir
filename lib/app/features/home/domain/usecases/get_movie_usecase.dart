import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/movie_repository.dart';

base class GetMovieUsecase extends Usecase<MovieEntity, GetMovieParams> {
  final MovieRepository repository;

  GetMovieUsecase(this.repository);

  @override
  Future<Either<Failure, MovieEntity>> call(GetMovieParams params) {
    return repository.getMovie(params.id);
  }
}

final class GetMovieParams extends BaseParams {
  final int id;

  GetMovieParams(this.id);

  @override
  List<Object?> get props => [id];
}