import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source_impl.dart';
import 'package:o_que_assistir/app/features/home/data/models/movie_model.dart';

import '../../../../fixtures/fixture_render.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MovieDataSourceImpl movieDataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    movieDataSource = MovieDataSourceImpl(mockHttpClient);
    registerFallbackValue(Uri.parse(baseUrl));
  });

  void setupHttpClientGetMovieSuccess200() {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(fixture("movie.json"), 200));
  }

  void setupHttpClientGetMoviesSuccess200() {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(fixture("movies.json"), 200));
  }

  void setupHttpClientFailure404() {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group("Get movie by id", () {
    const tMovieId = 550;
    final tMovieModel = MovieModel.fromJson(json.decode(fixture("movie.json")));
    test('should perform a GET on a url with movie by id being the endpoint',
        () async {
      // arrange
      setupHttpClientGetMovieSuccess200();

      // act
      movieDataSource.getMovie(tMovieId);

      // assert
      verify(() => mockHttpClient.get(
            Uri.parse(
                '$baseUrl/movie/$tMovieId?api_key=$apiKey&language=$language'),
            headers: {
              'Content-Type': 'application/json',
            },
          ));

      verifyNoMoreInteractions(mockHttpClient);
    });

    test('should return MovieModel when the response code is 200 (success)',
        () async {
      // arrange
      setupHttpClientGetMovieSuccess200();

      // act
      final result = await movieDataSource.getMovie(tMovieId);

      // assert
      expect(result, equals(tMovieModel));
    });

    test(
        'should throw a ServerException when the response of get movie code is 404 or other',
        () async {
      // arrange
      setupHttpClientFailure404();

      // act
      final call = movieDataSource.getMovie;

      // assert
      expect(
          () => call(tMovieId), throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group("Get movies", () {
    final tMoviesModels =
        MovieModel.fromJsonList(json.decode(fixture("movies.json"))['results']);
    test('should perform a GET on a url with movies being the endpoint',
        () async {
      // arrange
      setupHttpClientGetMoviesSuccess200();

      // act
      movieDataSource.getMovies(category: MovieCategory.popular);

      // assert
      verify(() => mockHttpClient.get(
            Uri.parse(
                '$baseUrl/movie/${MovieCategory.popular.value}?api_key=$apiKey&language=$language'),
            headers: {
              'Content-Type': 'application/json',
            },
          ));

      verifyNoMoreInteractions(mockHttpClient);
    });

    test(
        'should return List<MovieModel> when the response code is 200 (success)',
        () async {
      // arrange
      setupHttpClientGetMoviesSuccess200();

      // act
      final result =
          await movieDataSource.getMovies(category: MovieCategory.popular);

      // assert
      expect(result, equals(tMoviesModels));
    });

    test(
        'should throw a ServerException when the response of get movies code is 404 or other',
        () async {
      // arrange
      setupHttpClientFailure404();

      // act
      final call = movieDataSource.getMovies;

      // assert
      expect(() => call(category: MovieCategory.popular),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
