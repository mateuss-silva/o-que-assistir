import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/search_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/search_repository.dart';

import '../../../../core/error/failure.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource datasource;

  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List>> getSuggestions(String query) async {
    try {
      return Right(await datasource.getSuggestions(query));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
