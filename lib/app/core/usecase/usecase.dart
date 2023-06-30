import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';

abstract interface class Usecase<Entity, Params> {
  Future<Either<Failure, Entity>> call(Params params);
}

abstract base class BaseParams extends Equatable {
  @override
  List<Object?> get props => [];
}

final class NoParams extends BaseParams {}
