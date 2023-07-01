import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieEntity movie;
  const MovieCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => Modular.to.pushNamed("/movie-details/${movie.id}"),
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            movie.posterPath.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
