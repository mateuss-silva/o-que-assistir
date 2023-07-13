import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source_impl.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/search_data_source_impl.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/tv_serie_data_source_impl.dart';
import 'package:o_que_assistir/app/features/home/data/factories/media_factory.dart';
import 'package:o_que_assistir/app/features/home/data/repositories/movie_repository_impl.dart';
import 'package:o_que_assistir/app/features/home/data/repositories/search_repository_impl.dart';
import 'package:o_que_assistir/app/features/home/data/repositories/tv_serie_repository_impl.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_cast_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movie_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movies_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_suggestions_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_tv_serie_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_tv_series_usecase.dart';
import 'package:o_que_assistir/app/features/home/presentation/pages/home_page.dart';
import 'package:o_que_assistir/app/features/home/presentation/pages/movie_details_page.dart';
import 'package:o_que_assistir/app/features/home/presentation/pages/tv_serie_details_page.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/home_store.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/movie_details_store.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/tv_serie_details_store.dart';
import 'package:http/http.dart' as http;

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => MediaFactoryImpl()),
    // datasources
    Bind.factory((i) => MovieDataSourceImpl(i<http.Client>())),
    Bind.factory((i) => TVSerieDataSourceImpl(i<http.Client>())),
    Bind.factory(
        (i) => SearchDataSourceImpl(i<http.Client>(), i<MediaFactoryImpl>())),

    // repositories
    Bind.factory((i) => MovieRepositoryImpl(i<MovieDataSourceImpl>())),
    Bind.factory((i) => TVSerieRepositoryImpl(i<TVSerieDataSourceImpl>())),
    Bind.factory((i) => SearchRepositoryImpl(i<SearchDataSourceImpl>())),

    // usecases
    Bind.factory((i) => GetMovieUsecase(i<MovieRepositoryImpl>())),
    Bind.factory((i) => GetMoviesUsecase(i<MovieRepositoryImpl>())),
    Bind.factory((i) =>
        GetCastUsecase(i<MovieRepositoryImpl>(), i<TVSerieRepositoryImpl>())),
    Bind.factory((i) => GetTVSerieUsecase(i<TVSerieRepositoryImpl>())),
    Bind.factory((i) => GetTVSeriesUsecase(i<TVSerieRepositoryImpl>())),
    Bind.factory((i) => GetSuggestionsUsecase(i<SearchRepositoryImpl>())),

    // stores
    Bind.singleton((i) => HomeStore(i(), i(), i())),
    Bind.factory((i) => MovieDetailsStore(i(), i())),
    Bind.factory((i) => TVSerieDetailsStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute("/movie-details/:id",
        child: (_, args) =>
            MovieDetailsPage(movieId: int.parse(args.params['id']))),
    ChildRoute("/tv-serie-details/:id",
        child: (_, args) =>
            TVSerieDetailsPage(tvSerieId: int.parse(args.params['id']))),
  ];
}
