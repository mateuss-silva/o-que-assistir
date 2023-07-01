import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source_impl.dart';
import 'package:o_que_assistir/app/features/home/data/repositories/movie_repository_impl.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movie_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movies_usecase.dart';
import 'package:o_que_assistir/app/features/home/presentation/pages/home_page.dart';
import 'package:o_que_assistir/app/features/home/presentation/pages/movie_details_page.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/home_store.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/movie_details_store.dart';
import 'package:http/http.dart' as Http;

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => MovieDataSourceImpl(i<Http.Client>())),
    Bind.factory((i) => MovieRepositoryImpl(i<MovieDataSourceImpl>())),
    Bind.factory((i) => GetMovieUsecase(i<MovieRepositoryImpl>())),
    Bind.factory((i) => GetMoviesUsecase(i<MovieRepositoryImpl>())),
    Bind.factory((i) => HomeStore(i())),
    Bind.factory((i) => MovieDetailsStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute("/movie-details/:id",
        child: (_, args) =>
            MovieDetailsPage(movieId: int.parse(args.params['id']))),
  ];
}
