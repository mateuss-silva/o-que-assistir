import 'package:o_que_assistir/app/features/home/data/models/movie_model.dart';

abstract interface class MovieDataSource {
  Future<List<MovieModel>> getMovies();
  Future<MovieModel> getMovie(int id);
}