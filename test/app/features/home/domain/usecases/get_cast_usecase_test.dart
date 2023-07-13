import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_cast_usecase.dart';

import 'mocks.dart';

void main() {
  late GetCastUsecase usecase;
  late MockMovieRepository movieRepository;

  setUp(() {
    movieRepository = MockMovieRepository();
    usecase = GetMovieCastUsecase(movieRepository);
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
    when(() => movieRepository.getCast(any()))
        .thenAnswer((_) async => Right(tActors));
    // act
    final result = await usecase(GetCastParams(id: 1));
    // assert
    expect(result, Right(tActors));
    verify(() => movieRepository.getCast(1));
    verifyNoMoreInteractions(movieRepository);
  });

  test('should return a ServerFailure when get cast don"t succeed', () async {
    // arrange
    when(() => movieRepository.getCast(any()))
        .thenAnswer((_) async => Left(ServerFailure()));
    // act
    final result = await usecase(GetCastParams(id: 1));
    // assert
    expect(result, Left(ServerFailure()));
    verify(() => movieRepository.getCast(1));
    verifyNoMoreInteractions(movieRepository);
  });
}
