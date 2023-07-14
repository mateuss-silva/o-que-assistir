import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/core/common/extensions/nullable_extension.dart';
import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/search_store.dart';

class SuggestionWidget extends StatelessWidget {
  final MediaEntity suggestion;
  const SuggestionWidget({super.key, required this.suggestion});

  bool get isAMovie => suggestion is MovieEntity;
  bool get isATVSerie => suggestion is TVSerieEntity;

  MovieEntity get movie => suggestion as MovieEntity;
  TVSerieEntity get tvSerie => suggestion as TVSerieEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: SizedBox(
        height: 150,
        width: 32,
        child: imagePath.isNull
            ? const Icon(Icons.movie_creation_outlined)
            : Image.network(
                imagePath!.imageUrl,
                fit: BoxFit.cover,
                cacheHeight: 150,
              ),
      ),
      onTap: () => onClickSuggestion(suggestion),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  String? get imagePath {
    if (isAMovie) {
      return movie.posterPath;
    } else if (isATVSerie) {
      return tvSerie.posterPath;
    } else {
      throw Exception("Tipo de media não suportada");
    }
  }

  String get title {
    if (isAMovie) {
      return movie.title;
    } else if (isATVSerie) {
      return tvSerie.name;
    } else {
      throw Exception("Tipo de media não suportada");
    }
  }

  String get subtitle {
    if (isAMovie) {
      return movie.subtitle;
    } else if (isATVSerie) {
      return tvSerie.subtitle;
    } else {
      throw Exception("Tipo de media não suportada");
    }
  }

  onClickSuggestion(suggestion) {
    Modular.get<SearchStore>().closeSearch();
    viewDetails(suggestion);
  }

  void viewDetails(suggestion) {
    if (isAMovie) {
      Modular.to.pushNamed("/movie-details/${suggestion.id}");
    } else if (isATVSerie) {
      Modular.to.pushNamed("/tv-serie-details/${suggestion.id}");
    } else {
      throw Exception("Tipo de media não suportada");
    }
  }
}
