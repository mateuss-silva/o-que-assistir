import 'package:o_que_assistir/app/features/home/data/models/actor_model.dart';
import 'package:o_que_assistir/app/features/home/data/models/tv_serie_model.dart';

abstract interface class TVSerieDataSource {
  Future<List<TVSerieModel>> getTVSeries({required TVSerieCategory category});

  Future<TVSerieModel> getTVSerie(int id);

  Future<List<ActorModel>> getCast(int tvSerieId);
}

enum TVSerieCategory {
  airingToday("airing_today"),
  onTheAir("on_the_air"),
  topRated("top_rated"),
  popular("popular");

  final String value;

  const TVSerieCategory(this.value);
}
