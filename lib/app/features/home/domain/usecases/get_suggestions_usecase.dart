import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/search_repository.dart';

class GetSuggestionsUsecase implements Usecase<List, GetSuggestionsParams> {
  final SearchRepository searchRepository;

  GetSuggestionsUsecase(this.searchRepository);

  @override
  Future<Either<Failure, List<MediaEntity>>> call(GetSuggestionsParams params) {
    return searchRepository.getSuggestions(params.query);
  }
}

final class GetSuggestionsParams extends BaseParams {
  final String query;

  GetSuggestionsParams({required this.query});

  @override
  List<Object?> get props => [query];
}
