import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/tv_serie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/tv_serie_repository.dart';

class GetTVSeriesUsecase
    implements Usecase<List<TVSerieEntity>, GetTVSeriesParams> {
  final TVSerieRepository repository;

  GetTVSeriesUsecase(this.repository);

  @override
  Future<Either<Failure, List<TVSerieEntity>>> call(GetTVSeriesParams params) {
    return repository.getTVSeries(category: params.category);
  }
}

final class GetTVSeriesParams extends BaseParams {
  final TVSerieCategory category;

  GetTVSeriesParams(this.category);

  @override
  List<Object?> get props => [category];
}
