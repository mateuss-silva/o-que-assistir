import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movies_usecase.dart';

import 'mocks.dart';

void main() {
  late GetMoviesUsecase usecase;
  late MockMovieRepository mockMovieRepository;

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

  test('should be a subclass of usecase', () async {
    expect(usecase, isA<GetMoviesUsecase>());
  });

  test('should get popular movies from the repository', () async {
    // arrange
    when(() => mockMovieRepository.getMovies(category: MovieCategory.popular))
        .thenAnswer((_) async => Right(tMovieList));

    // act
    final result = await usecase(GetMoviesParams(MovieCategory.popular));

    // assert
    expect(result, Right(tMovieList));
    verify(
        () => mockMovieRepository.getMovies(category: MovieCategory.popular));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
