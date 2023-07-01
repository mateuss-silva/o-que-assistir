import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/movies_widget.dart';
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
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Pesquisar filmes, séries, etc.",
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                    ),
                  ),
                ),
              ),
              MoviesWidget(
                movies: store.popularMovies,
                title: "Populares agora",
              ),
              MoviesWidget(
                movies: store.nowPlayingMovies,
                title: "Em cartaz",
              ),
              MoviesWidget(
                movies: store.topRatedMovies,
                title: "Mais bem avaliados",
              ),
              MoviesWidget(
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
}
