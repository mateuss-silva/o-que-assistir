import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/core/usecase/usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movies_usecase.dart';

import 'mock_movie_repository.dart';

void main() {
  late final GetMoviesUsecase usecase;
  late final MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetMoviesUsecase(mockMovieRepository);
  });

  final tMovieList = [
    MovieEntity(
      id: "1",
      title: 'title',
      overview: 'overview',
      releaseDate: DateTime(2021, 10, 15),
      voteAverage: 1,
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
      genres: const [],
      originalTitle: 'originalTitle',
      popularity: 1,
      runtime: 1,
      status: 'status',
      voteCount: 1,
    )
  ];

  test('should get movies from the repository', () async {
    // arrange
    when(() => mockMovieRepository.getMovies())
        .thenAnswer((_) async => Right(tMovieList));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, Right(tMovieList));
    verify(() => mockMovieRepository.getMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
