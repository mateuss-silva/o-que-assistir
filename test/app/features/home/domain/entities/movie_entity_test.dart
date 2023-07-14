import 'package:flutter_test/flutter_test.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';

void main() {
  final movie = MovieEntity(
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
    runtime: 70,
    category: MovieCategory.any,
  );

  test("should get a string with the movie duration formatted", () {
    //arrange
    const expected = "1h 10m";

    //act
    final duration = movie.duration;

    //assert
    expect(duration, expected);
  });
}
