import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/models/actor_model.dart';
import 'package:o_que_assistir/app/features/home/data/models/movie_model.dart';
import 'package:o_que_assistir/app/features/home/data/repositories/movie_repository_impl.dart';

class MockRemoteDataSource extends Mock implements MovieDataSource {}

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late MovieRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = MovieRepositoryImpl(mockRemoteDataSource);
    registerFallbackValue(MovieCategory.popular);
  });

  final tMovieModel = MovieModel(
    id: "1",
    title: 'title',
    overview: 'overview',
    posterPath: 'posterPath',
    backdropPath: 'backdropPath',
    voteAverage: 1,
    releaseDate: DateTime.now(),
    genres: const [],
    originalTitle: 'originalTitle',
    popularity: 1,
    status: "Released",
    voteCount: 10,
    runtime: 10,
    category: MovieCategory.any,
  );

  final tMoviesModels = [tMovieModel];

  test('should return remote data source MovieModel when is success', () async {
    // arrange
    when(() => mockRemoteDataSource.getMovie(any()))
        .thenAnswer((_) async => tMovieModel);

    // act
    final result = await repository.getMovie(1);

    // assert
    expect(result, Right(tMovieModel));

    verify(() => mockRemoteDataSource.getMovie(1));
    verifyNoMoreInteractions(mockRemoteDataSource);
  });

  test("should return Server Failure when get movie has error", () async {
    // arrange
    when(() => mockRemoteDataSource.getMovie(any()))
        .thenThrow(ServerException());

    // act
    final result = await repository.getMovie(1);

    // assert
    expect(result, Left(ServerFailure()));

    verify(() => mockRemoteDataSource.getMovie(1));
    verifyNoMoreInteractions(mockRemoteDataSource);
  });

  test('should return remote data source list of MovieModel when is success',
      () async {
    // arrange
    when(() => mockRemoteDataSource.getMovies(category: any(named: "category")))
        .thenAnswer((_) async => tMoviesModels);

    // act
    final result = await repository.getMovies(category: MovieCategory.popular);

    // assert
    expect(result, Right(tMoviesModels));

    verify(
        () => mockRemoteDataSource.getMovies(category: MovieCategory.popular));
    verifyNoMoreInteractions(mockRemoteDataSource);
  });

  test("should return Server Failure when get movies has error", () async {
    // arrange
    when(() => mockRemoteDataSource.getMovies(category: any(named: "category")))
        .thenThrow(ServerException());

    // act
    final result = await repository.getMovies(category: MovieCategory.popular);

    // assert
    expect(result, Left(ServerFailure()));

    verify(
        () => mockRemoteDataSource.getMovies(category: MovieCategory.popular));
    verifyNoMoreInteractions(mockRemoteDataSource);
  });

  test('should return remote data source list of ActorModel when is success',
      () async {
    // arrange
    final cast = [
      const ActorModel(
        id: "1",
        name: 'name',
        character: 'character',
        profilePath: 'profilePath',
        knownFor: 'acting',
        popularity: 1.0,
      )
    ];
    when(() => mockRemoteDataSource.getCast(any()))
        .thenAnswer((_) async => cast);

    // act
    final result = await repository.getCast(1);

    // assert
    expect(result, Right(cast));
    verify(() => mockRemoteDataSource.getCast(1));
    verifyNoMoreInteractions(mockRemoteDataSource);
  });

  test("should return Server Failure when get cast has error", () async {
    // arrange
    when(() => mockRemoteDataSource.getCast(any()))
        .thenThrow(ServerException());

    // act
    final result = await repository.getCast(1);

    // assert
    expect(result, Left(ServerFailure()));

    verify(() => mockRemoteDataSource.getCast(1));
    verifyNoMoreInteractions(mockRemoteDataSource);
  });
}
