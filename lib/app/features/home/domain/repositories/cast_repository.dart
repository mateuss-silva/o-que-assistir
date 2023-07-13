import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';

abstract interface class CastRepository {
  Future<Either<Failure, List<ActorEntity>>> getCast(int movieId);
}
