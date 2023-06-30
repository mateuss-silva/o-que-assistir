import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/core/error/exceptions.dart';
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
    registerFallbackValue(Uri.parse('https://api.themoviedb.org/3/movie'));
  });
  void setupHttpClientSuccess200() {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(fixture("movie.json"), 200));
  }

  void setupHttpClientFailure404() {
    when(() => mockHttpClient.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  const tMovieId = 550;
  final tMovieModel = MovieModel.fromJson(json.decode(fixture("movie.json")));

  test('should perform a GET on a url with movie being the endpoint', () async {
    // arrange
    setupHttpClientSuccess200();

    // act
    movieDataSource.getMovie(tMovieId);

    // assert
    verify(() => mockHttpClient.get(
          Uri.parse(
              'https://api.themoviedb.org/3/movie/$tMovieId?api_key=$apiKey'),
          headers: {
            'Content-Type': 'application/json',
          },
        ));

    verifyNoMoreInteractions(mockHttpClient);
  });

  test('should return MovieModel when the response code is 200 (success)',
      () async {
    // arrange
    setupHttpClientSuccess200();

    // act
    final result = await movieDataSource.getMovie(tMovieId);

    // assert
    expect(result, equals(tMovieModel));
  });

  test('should throw a ServerException when the response code is 404 or other',
      () async {
    // arrange
    setupHttpClientFailure404();

    // act
    final call = movieDataSource.getMovie;

    // assert
    expect(() => call(tMovieId), throwsA(const TypeMatcher<ServerException>()));
  });
}
