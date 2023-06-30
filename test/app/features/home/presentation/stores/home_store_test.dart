import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/error/failure_extension.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movie_usecase.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/home_store.dart';

class MockGetMovieUsecase extends Mock implements GetMovieUsecase {}

void main() {
  late HomeStore store;
  late MockGetMovieUsecase mockGetMovieUsecase;
  const int tMovieId = 550;

  setUp(() {
    mockGetMovieUsecase = MockGetMovieUsecase();
    store = HomeStore(mockGetMovieUsecase);
    registerFallbackValue(GetMovieParams(tMovieId));
  });

  const tId = "550";
  const tTitle = 'Fight Club';
  const tOriginalTitle = 'Fight Club';
  const tBackdropPath = "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg";
  final tHomepage = Uri.parse('http://www.foxmovies.com/movies/fight-club');
  const tGenres = <GenderModel>[
    GenderModel(id: "1", name: 'Drama'),
    GenderModel(id: "2", name: 'Thriller'),
    GenderModel(id: "3", name: 'Comedy')
  ];
  const tImdbId = 'tt0137523';
  const tPopularity = 73.566;
  const tPosterPath = '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg';
  final tReleaseDate = DateTime(1999, 10, 15);
  const tStatus = 'Released';
  const tVoteAverage = 8.435;
  const tVoteCount = 26651;
  const tOverview = '''
A ticking-time-bomb insomniac and a slippery soap salesman channel primal male 
aggression into a shocking new form of therapy. Their concept catches on, with 
underground "fight clubs" forming in every town, until an eccentric gets in the 
way and ignites an out-of-control spiral toward oblivion.''';

  final tMovie = MovieEntity(
    id: tId,
    title: tTitle,
    originalTitle: tOriginalTitle,
    backdropPath: tBackdropPath,
    homepage: tHomepage,
    overview: tOverview,
    popularity: tPopularity,
    posterPath: tPosterPath,
    releaseDate: tReleaseDate,
    status: tStatus,
    voteAverage: tVoteAverage,
    voteCount: tVoteCount,
    genres: tGenres,
    imdbId: tImdbId,
  );

  test('should get data from use case', () async {
    // arrange
    when(() => mockGetMovieUsecase(any()))
        .thenAnswer((_) async => Right(tMovie));

    // act
    await store.getMovie(tMovieId);

    // assert
    expect(store.movie, tMovie);
    verify(() => mockGetMovieUsecase(GetMovieParams(tMovieId)));
    verifyNoMoreInteractions(mockGetMovieUsecase);
  });

  test('should get error from use case', () async {
    // arrange
    when(() => mockGetMovieUsecase(any()))
        .thenAnswer((_) async => Left(ServerFailure()));

    // act
    await store.getMovie(tMovieId);

    // assert
    expect(store.errorMessage, ServerFailure().message);
    verify(() => mockGetMovieUsecase(GetMovieParams(tMovieId)));
    verifyNoMoreInteractions(mockGetMovieUsecase);
  });
}
