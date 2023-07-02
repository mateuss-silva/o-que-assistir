import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/data/models/movie_model.dart';

import '../../../../fixtures/fixture_render.dart';

void main() {
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

  final movieModel = MovieModel(
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
  test('should be a subclass of Entity', () async {
    expect(movieModel, isA<MovieModel>());
  });

  test('should return a valid model for the JSON movie', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture("movie.json"));

    // act
    final result = MovieModel.fromJson(jsonMap);

    // assert
    expect(result, movieModel);
  });

  test('should return a JSON map containing the proper data', () {
    // act
    final result = movieModel.toJson();

    // assert
    final expectedMap = {
      "id": tId,
      "title": tTitle,
      "original_title": tOriginalTitle,
      "backdrop_path": tBackdropPath,
      "overview": tOverview,
      "popularity": tPopularity,
      "poster_path": tPosterPath,
      "release_date": tReleaseDate,
      "status": tStatus,
      "vote_average": tVoteAverage,
      "vote_count": tVoteCount,
      "genres": tGenres.map((e) => e.toJson()).toList(),
      "runtime": tRuntime,
    };

    expect(result, expectedMap);
  });

  test('should return a JSON map containing a list of movie data', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture("movies.json"));

    // act
    final result = MovieModel.fromJsonList(jsonMap['results']);

    // assert
    expect(result, isA<List<MovieModel>>());
  });
}
