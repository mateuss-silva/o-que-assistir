import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movies_usecase.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/home_store.dart';

class MockGetMoviesUsecase extends Mock implements GetMoviesUsecase {}

void main() {
  late HomeStore store;
  late MockGetMoviesUsecase getMoviesUsecase;

  setUp(() {
    getMoviesUsecase = MockGetMoviesUsecase();
    store = HomeStore(getMoviesUsecase);
    registerFallbackValue(GetMoviesParams(MovieCategory.popular));
  });

  final tMovies = <MovieEntity>[
    MovieEntity(
      id: "1",
      title: 'Fight Club',
      originalTitle: 'Fight Club',
      backdropPath: "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
      overview: '',
      genres: const [],
      popularity: 73.566,
      posterPath: '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
      releaseDate: DateTime(1999, 10, 15),
      status: 'Released',
      voteAverage: 8.435,
      voteCount: 26651,
      runtime: 139,
    ),
  ];

  test('should get data from the usecase', () async {
    // arrange
    when(() => getMoviesUsecase(any())).thenAnswer((_) async => Right(tMovies));

    // act
    await store.getMovies();

    // assert
    expect(store.movies, tMovies);
    verify(() => getMoviesUsecase(GetMoviesParams(MovieCategory.popular)));
    verifyNoMoreInteractions(getMoviesUsecase);
  });

  test('should get error from the usecase', () async {
    // arrange
    when(() => getMoviesUsecase(any()))
        .thenAnswer((_) async => Left(ServerFailure()));

    // act
    await store.getMovies();

    // assert
    expect(store.movies, []);
    verify(() => getMoviesUsecase(GetMoviesParams(MovieCategory.popular)));
    verifyNoMoreInteractions(getMoviesUsecase);
  });
}
