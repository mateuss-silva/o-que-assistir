import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/tv_serie_repository.dart';

class GetTVSerieUsecase implements Usecase<TVSerieEntity, GetTVSerieParams> {
  final TVSerieRepository repository;

  GetTVSerieUsecase(this.repository);

  @override
  Future<Either<Failure, TVSerieEntity>> call(GetTVSerieParams params) {
    return repository.getTVSerie(params.id);
  }
}

final class GetTVSerieParams extends BaseParams {
  final int id;

  GetTVSerieParams(this.id);

  @override
  List<Object?> get props => [id];
}
