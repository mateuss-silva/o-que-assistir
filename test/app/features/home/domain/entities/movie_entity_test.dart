import 'package:flutter_test/flutter_test.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';

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
    homepage: Uri.parse('https://www.google.com'),
    imdbId: "23t",
    originalTitle: 'originalTitle',
    popularity: 1,
    status: "Released",
    voteCount: 10,
    runtime: 70,
  );

  test("should get a string with the movie duration formatted", () {
    //arrange
    const expected = "1h 10m";

    //act
    final duration = movie.movieDuration();

    //assert
    expect(duration, expected);
  });
}
