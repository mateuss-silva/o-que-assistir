import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, List>> getSuggestions(String query);
}
