import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movie_usecase.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';

import 'mocks.dart';

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
    overview: tOverview,
    popularity: tPopularity,
    posterPath: tPosterPath,
    releaseDate: tReleaseDate,
    status: tStatus,
    voteAverage: tVoteAverage,
    voteCount: tVoteCount,
    genres: tGenres,
    runtime: tRuntime,
    category: MovieCategory.any,
  );

  test('should be a subclass of usecase', () async {
    expect(usecase, isA<GetMovieUsecase>());
  });

  test('should get movie details from the repository', () async {
    when(() => mockMovieRepository.getMovie(any()))
        .thenAnswer((_) async => Right(tMovie));

    final result = await usecase(GetMovieParams(int.parse(tId)));

    expect(result, Right(tMovie));

    verify(() => mockMovieRepository.getMovie(int.parse(tId)));

    verifyNoMoreInteractions(mockMovieRepository);
  });
}
