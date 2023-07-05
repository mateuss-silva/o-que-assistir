import 'package:flutter/material.dart';
import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/gender_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';

class SearchSuggestionsWidget extends StatelessWidget {
  final List suggestions;
  final Function(dynamic suggestion) onSuggestionSelected;
  final bool showSuggestions;
  final bool showLoading;
  const SearchSuggestionsWidget({
    super.key,
    required this.suggestions,
    required this.onSuggestionSelected,
    required this.showSuggestions,
    required this.showLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AnimatedContainer(
        height: showLoading || (showSuggestions && suggestions.isNotEmpty)
            ? 300
            : 0,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: showLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = suggestions[index];

                  return suggestion is MovieEntity
                      ? _suggestionWidget(
                          image: suggestion.posterPath,
                          originalName: suggestion.originalTitle,
                          date: suggestion.releaseDate,
                          voteAverage: suggestion.voteAverage,
                          genres: suggestion.genres,
                          suggestion: suggestion,
                          title: suggestion.title,
                        )
                      : _suggestionWidget(
                          image: suggestion.posterPath,
                          originalName: suggestion.originalName,
                          date: suggestion.firstAirDate,
                          voteAverage: suggestion.voteAverage,
                          genres: suggestion.genres,
                          suggestion: suggestion,
                          title: suggestion.name,
                        );
                },
              ),
      ),
    );
  }

  Widget _suggestionWidget({
    required String? image,
    required String originalName,
    required DateTime? date,
    required double voteAverage,
    required List<GenderEntity> genres,
    required String title,
    required suggestion,
  }) {
    List<String> subtitle = [
      "Série",
      originalName,
      "${(voteAverage * 10).toInt()}%",
      (date?.year ?? "????").toString(),
      if (genres.isNotEmpty && genres.first.name.isNotNullOrEmpty)
        genres.first.name!
    ];
    return ListTile(
      dense: true,
      leading: SizedBox(
        height: 150,
        width: 32,
        child: image == null
            ? const Icon(Icons.movie_creation_outlined)
            : Image.network(
                image.imageUrl,
                fit: BoxFit.cover,
                cacheHeight: 150,
              ),
      ),
      onTap: () => onSuggestionSelected(suggestion),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        subtitle.join(" - "),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
