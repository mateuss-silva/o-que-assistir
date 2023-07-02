import 'package:o_que_assistir/app/features/home/data/models/actor_model.dart';
import 'package:o_que_assistir/app/features/home/data/models/movie_model.dart';

abstract interface class MovieDataSource {
  Future<List<MovieModel>> getMovies({required MovieCategory category});

  Future<MovieModel> getMovie(int id);

  Future<List<ActorModel>> getCast(int movieId);
}

enum MovieCategory {
  popular("popular"),
  nowPlaying("now_playing"),
  topRated("top_rated"),
  upcoming("upcoming");

  final String value;

  const MovieCategory(this.value);
}
