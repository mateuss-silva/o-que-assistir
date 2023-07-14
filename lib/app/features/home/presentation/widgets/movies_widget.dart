import 'package:flutter/material.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/movie_card_widget.dart';

class MoviesWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final String title;
  const MoviesWidget({super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
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
              final child = SizedBox(
                height: 200,
                width: 128,
                child: MovieCardWidget(movie: movie),
              );
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
