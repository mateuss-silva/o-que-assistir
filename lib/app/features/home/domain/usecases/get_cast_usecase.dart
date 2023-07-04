import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/movie_repository.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/tv_serie_repository.dart';

class GetCastUsecase implements Usecase<List<ActorEntity>, GetCastParams> {
  final MovieRepository movieRepository;
  final TVSerieRepository tvSerieRepository;

  GetCastUsecase(this.movieRepository, this.tvSerieRepository);

  @override
  Future<Either<Failure, List<ActorEntity>>> call(GetCastParams params) {
    if (params.isMovie) {
      return movieRepository.getCast(params.id);
    } else {
      return tvSerieRepository.getCast(params.id);
    }
  }
}

final class GetCastParams extends BaseParams {
  final int id;
  final bool isMovie;

  GetCastParams({
    required this.id,
    required this.isMovie,
  });

  @override
  List<Object?> get props => [id, isMovie];
}
