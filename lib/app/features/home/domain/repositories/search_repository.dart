import 'package:dartz/dartz.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, List<MediaEntity>>> getSuggestions(String query);
}
