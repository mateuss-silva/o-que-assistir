import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/movie_repository.dart';

class GetCastUsecase implements Usecase<List<ActorEntity>, GetCastParams> {
  final MovieRepository repository;

  GetCastUsecase(this.repository);

  @override
  Future<Either<Failure, List<ActorEntity>>> call(GetCastParams params) {
    return repository.getCast(params.movieId);
  }
}

final class GetCastParams extends BaseParams {
  final int movieId;

  GetCastParams(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
