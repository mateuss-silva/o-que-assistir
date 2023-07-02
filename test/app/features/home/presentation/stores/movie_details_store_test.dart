import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/error/failure_extension.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_cast_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movie_usecase.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/movie_details_store.dart';

class MockGetMovieUsecase extends Mock implements GetMovieUsecase {}

class MockGetCastUsecase extends Mock implements GetCastUsecase {}

void main() {
  late MovieDetailsStore store;
  late MockGetMovieUsecase mockGetMovieUsecase;
  late MockGetCastUsecase mockGetCastUsecase;

  const int tMovieId = 550;

  setUp(() {
    mockGetMovieUsecase = MockGetMovieUsecase();
    mockGetCastUsecase = MockGetCastUsecase();
    store = MovieDetailsStore(mockGetMovieUsecase, mockGetCastUsecase);
    registerFallbackValue(GetMovieParams(tMovieId));
    registerFallbackValue(GetCastParams(tMovieId));
  });

  const tId = "550";
  const tTitle = 'Fight Club';
  const tOriginalTitle = 'Fight Club';
  const tBackdropPath = "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg";
  const tGenres = <GenderModel>[
    GenderModel(id: "1", name: 'Drama'),
    GenderModel(id: "2", name: 'Thriller'),
    GenderModel(id: "3", name: 'Comedy')
  ];
  const tPopularity = 73.566;
  const tPosterPath = '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg';
  final tReleaseDate = DateTime(1999, 10, 15);
  const tStatus = 'Released';
  const tVoteAverage = 8.435;
  const tVoteCount = 26651;
  const tRuntime = 139;
  const tOverview =
      '''
A ticking-time-bomb insomniac and a slippery soap salesman channel primal male 
aggression into a shocking new form of therapy. Their concept catches on, with 
underground "fight clubs" forming in every town, until an eccentric gets in the 
way and ignites an out-of-control spiral toward oblivion.''';

  final tMovie = MovieEntity(
    id: tId,
    title: tTitle,
    originalTitle: tOriginalTitle,
    backdropPath: tBackdropPath,
    overview: tOverview,
    popularity: tPopularity,
    posterPath: tPosterPath,
    releaseDate: tReleaseDate,
    status: tStatus,
    voteAverage: tVoteAverage,
    voteCount: tVoteCount,
    genres: tGenres,
    runtime: tRuntime,
  );

  final tCast = <ActorEntity>[
    const ActorEntity(
      id: "819",
      name: 'Edward Norton',
      character: 'The Narrator',
      profilePath: '/eIkFHNlfretLS1spAcIoihKUS62.jpg',
      knownFor: "Acting",
      popularity: 1,
    ),
    const ActorEntity(
      id: "287",
      name: 'Brad Pitt',
      character: 'Tyler Durden',
      profilePath: '/kc3M04QQAuZ9woUvH3Ju5T7ZqG5.jpg',
      knownFor: "Acting",
      popularity: 1,
    ),
    const ActorEntity(
      id: "1283",
      name: 'Helena Bonham Carter',
      character: 'Marla Singer',
      profilePath: '/58oJPFG1wefMC0Vj7sUzbzbmEiz.jpg',
      knownFor: "Acting",
      popularity: 1,
    ),
  ];

  test('should get data from get movie usecase', () async {
    // arrange
    when(() => mockGetMovieUsecase(any()))
        .thenAnswer((_) async => Right(tMovie));
    when(() => mockGetCastUsecase(any())).thenAnswer((_) async => Right(tCast));

    // act
    await store.getMovie(tMovieId);

    // assert
    expect(store.movie, tMovie);
    verify(() => mockGetMovieUsecase(GetMovieParams(tMovieId)));
    verifyNoMoreInteractions(mockGetMovieUsecase);
  });

  test('should get error from get movie usecase', () async {
    // arrange
    when(() => mockGetMovieUsecase(any()))
        .thenAnswer((_) async => Left(ServerFailure()));
    when(() => mockGetCastUsecase(any())).thenAnswer((_) async => Right(tCast));

    // act
    await store.getMovie(tMovieId);

    // assert
    expect(store.errorMessageStream.value, ServerFailure().message);
    verify(() => mockGetMovieUsecase(GetMovieParams(tMovieId)));
    verifyNoMoreInteractions(mockGetMovieUsecase);
  });

  test("should get cast data from usecase", () async {
    //arrange
    when(() => mockGetMovieUsecase(any()))
        .thenAnswer((_) async => Right(tMovie));
    when(() => mockGetCastUsecase(any())).thenAnswer((_) async => Right(tCast));

    //act
    await store.getMovie(tMovieId);

    //assert
    expect(store.cast, tCast);
    verify(() => mockGetCastUsecase(GetCastParams(tMovieId)));
    verifyNoMoreInteractions(mockGetCastUsecase);
  });

  test("should get error from get cast usecase", () async {
    //arrange
    when(() => mockGetCastUsecase(any()))
        .thenAnswer((_) async => Left(ServerFailure()));
    when(() => mockGetMovieUsecase(any()))
        .thenAnswer((_) async => Right(tMovie));

    //act
    await store.getMovie(tMovieId);

    //assert
    expect(store.errorMessageStream.value, ServerFailure().message);
    verify(() => mockGetCastUsecase(GetCastParams(tMovieId)));
    verifyNoMoreInteractions(mockGetCastUsecase);
  });
}
