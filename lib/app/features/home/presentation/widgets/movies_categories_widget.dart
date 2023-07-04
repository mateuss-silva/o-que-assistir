import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/home_store.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/movies_widget.dart';

class MoviesCategoriesWidget extends StatelessWidget {
  const MoviesCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeStore store = Modular.get<HomeStore>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
