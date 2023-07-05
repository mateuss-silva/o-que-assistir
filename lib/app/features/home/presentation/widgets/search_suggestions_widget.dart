import 'package:flutter/material.dart';
import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';

class SearchSuggestionsWidget extends StatelessWidget {
  final List suggestions;
  final Function(dynamic suggestion) onSuggestionSelected;
  const SearchSuggestionsWidget({
    super.key,
    required this.suggestions,
    required this.onSuggestionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            final subtitle =
                "${(suggestion.voteAverage * 10).toInt()}% - ${suggestion.releaseDate.year} - ${suggestion.genres.isNotEmpty ? suggestion.genres.first.name : ""}";
            return ListTile(
                dense: true,
                leading: Image.network(
                  (suggestion.posterPath as String).imageUrl,
                  fit: BoxFit.cover,
                  cacheHeight: 150,
                  cacheWidth: 100,
                ),
                onTap: () => onSuggestionSelected(suggestion),
                title: Text(
                  suggestion.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ));
          },
        ),
      ),
    );
  }
}
