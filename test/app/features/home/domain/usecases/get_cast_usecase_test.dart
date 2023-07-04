import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_cast_usecase.dart';

import 'mock_movie_repository.dart';

void main() {
  late GetCastUsecase usecase;
  late MockMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetCastUsecase(repository);
  });

  final tActors = [
    const ActorEntity(
      id: "1",
      name: 'name',
      character: 'character',
      profilePath: 'profilePath',
      knownFor: 'acting',
      popularity: 1.0,
    )
  ];

  test('should be a subclass of usecase', () async {
    expect(usecase, isA<GetCastUsecase>());
  });

  test('should get a list of actors from the repository', () async {
    // arrange
    when(()=> repository.getCast(any())).thenAnswer((_) async => Right(tActors));
    // act
    final result = await usecase(GetCastParams(1));
    // assert
    expect(result, Right(tActors));
    verify( ()=> repository.getCast(1));
    verifyNoMoreInteractions(repository);
  });

  test('should return a ServerFailure when get cast don"t succeed', () async {
    // arrange
    when(()=> repository.getCast(any())).thenAnswer((_) async => Left(ServerFailure()));
    // act
    final result = await usecase(GetCastParams(1));
    // assert
    expect(result, Left(ServerFailure()));
    verify( ()=> repository.getCast(1));
    verifyNoMoreInteractions(repository);
  });
}
