import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source_impl.dart';
import 'package:o_que_assistir/app/features/home/data/repositories/movie_repository_impl.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movie_usecase.dart';
import 'presentation/stores/home_store.dart';
import 'presentation/pages/home_page.dart';
import 'package:http/http.dart' as Http;
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => MovieDataSourceImpl(i<Http.Client>())),
    Bind.factory((i) => MovieRepositoryImpl(i<MovieDataSourceImpl>())),
    Bind.factory((i) => GetMovieUsecase(i<MovieRepositoryImpl>())),
    Bind.factory((i) => HomeStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
