import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/search_store.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/suggestion_widget.dart';

class SearchSuggestionsWidget extends StatelessWidget {
  const SearchSuggestionsWidget({super.key});

  double get suggestionsBoxHeight {
    return hasContent ? 300 : 0;
  }

  bool get hasContent {
    return isSearching || isVisibleAndHasContent;
  }

  bool get isVisibleAndHasContent {
    return isVisible && hasSuggestions;
  }

  bool get isVisible {
    return Modular.get<SearchStore>().showSearchBar;
  }

  bool get hasSuggestions {
    return Modular.get<SearchStore>().suggestions.isNotEmpty;
  }

  bool get isSearching {
    return Modular.get<SearchStore>().searching;
  }

  List<MediaEntity> get suggestions {
    return Modular.get<SearchStore>().suggestions;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AnimatedContainer(
          height: suggestionsBoxHeight,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: isSearching
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: suggestions.length,
                  itemBuilder: (_, index) =>
                      SuggestionWidget(suggestion: suggestions[index]),
                ),
        ),
      );
    });
  }
}
