import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/gender_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/repositories/movie_repository.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movie_usecase.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetMovieUsecase usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetMovieUsecase(mockMovieRepository);
  });

  const tId = "550";
  const tTitle = 'Fight Club';
  const tOriginalTitle = 'Fight Club';
  const tBackdropPath = "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg";
  final tHomepage =
      Uri.dataFromString('http://www.foxmovies.com/movies/fight-club');
  const tGenres = <GenderEntity>[
    GenderEntity(id: "1", name: 'Drama'),
    GenderEntity(id: "2", name: 'Thriller'),
    GenderEntity(id: "3", name: 'Comedy')
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

  test('should get movie details from the repository', () async {
    when(() => mockMovieRepository.getMovie(any()))
        .thenAnswer((_) async => Right(tMovie));

    final result = await usecase(GetMovieParams(int.parse(tId)));

    expect(result, Right(tMovie));

    verify(() => mockMovieRepository.getMovie(int.parse(tId)));

    verifyNoMoreInteractions(mockMovieRepository);
  });
}
