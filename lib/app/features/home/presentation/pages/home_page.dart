import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/movie_card_widget.dart';
import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();

    store.getMovies();

    store.errorMessageStream.listen(_showErrorMessage);
  }

  _showErrorMessage(String? message) {
    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red[500],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (store.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 32),
              _moviesCategory(
                movies: store.popularMovies,
                title: "Populares agora",
              ),
              _moviesCategory(
                movies: store.nowPlayingMovies,
                title: "Em cartaz",
              ),
              _moviesCategory(
                movies: store.topRatedMovies,
                title: "Mais bem avaliados",
              ),
              _moviesCategory(
                movies: store.upcomingMovies,
                title: "Próximos lançamentos",
              ),
              const SizedBox(height: 32),
            ],
          );
        },
      ),
    );
  }

  Widget _moviesCategory({
    required List<MovieEntity> movies,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final movie = movies[index];
              final child = MovieCardWidget(movie: movie);
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: child,
                );
              } else if (index == movies.length) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: child,
                );
              }
              return child;
            },
          ),
        ),
      ],
    );
  }
}
