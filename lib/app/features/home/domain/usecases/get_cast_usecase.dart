import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/cast_repository.dart';

sealed class GetCastUsecase
    implements Usecase<List<ActorEntity>, GetCastParams> {
  final CastRepository castRepository;

  GetCastUsecase(this.castRepository);

  @override
  Future<Either<Failure, List<ActorEntity>>> call(GetCastParams params) {
    return castRepository.getCast(params.id);
  }
}

final class GetCastParams extends BaseParams {
  final int id;

  GetCastParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class GetMovieCastUsecase extends GetCastUsecase {
  GetMovieCastUsecase(super.castRepository);
}

class GetTVSerieCastUsecase extends GetCastUsecase {
  GetTVSerieCastUsecase(super.castRepository);
}
