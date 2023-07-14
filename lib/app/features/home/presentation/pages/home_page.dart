import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/core/common/extensions/nullable_extension.dart';
import 'package:o_que_assistir/app/core/error/failure_extension.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/presentation/stores/search_store.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/loading_categories.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/movies_categories_widget.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/search_suggestions_widget.dart';
import 'package:o_que_assistir/app/features/home/presentation/widgets/tv_series_categories_widget.dart';
import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final store = Modular.get<HomeStore>();
  final searchStore = Modular.get<SearchStore>();

  late final fadeController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final animation = Tween(begin: 0.0, end: 1.0).animate(fadeController);

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 220,
                  child: Image.network(
                    searchBackdropImage,
                    fit: BoxFit.fitWidth,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress.isNull) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Observer(builder: (_) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeOut,
                      child: searchStore.showSearchBar
                          ? SearchBarWidget(
                              onSearch: (q) => searchStore.search(
                                  q,
                                  (failure) =>
                                      _showErrorMessage(failure.message)),
                              onSubmitted: closeSearch,
                              controller: controller,
                            )
                          : Align(
                              alignment: Alignment.bottomLeft,
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.background,
                                ),
                                onPressed: initSearch,
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    );
                  }),
                ),
                Observer(builder: (_) {
                  return FadeTransition(
                    opacity: animation,
                    child: SearchSuggestionsWidget(
                      showLoading: searchStore.searchingSuggestions,
                      suggestions: searchStore.suggestions,
                      showSuggestions: searchStore.showSearchBar,
                      onSuggestionSelected: onClickSuggestion,
                    ),
                  );
                }),
                const SizedBox(height: 16),
                Observer(builder: (_) {
                  return Align(
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(32),
                      onPressed: _onPressToggle,
                      isSelected: store.showMovieOrSeries,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("Filmes"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text("Séries"),
                        ),
                      ],
                    ),
                  );
                }),
                Observer(
                  builder: (_) {
                    if (store.loading) {
                      return const LoadingCategoriesWidget();
                    }

                    return store.showMovies
                        ? const MoviesCategoriesWidget()
                        : const TVSeriesCategoriesWidget();
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  closeSearch() {
    controller.clear();
    searchStore.setSuggestions([]);
    searchStore.setShowSearchBar(false);
    fadeController.reverse();
  }

  void initSearch() {
    searchStore.setShowSearchBar(true);
    searchStore.setSuggestions([]);
    fadeController.forward();
  }

  void _onPressToggle(int index) {
    var showMoviesSelected = (index == 0);
    if (showMoviesSelected == store.showMovies) {
      return;
    }
    store.setShowMovies(!store.showMovies);

    if (store.showMovies) {
      store.getMovies();
    } else {
      store.getTVSeries();
    }
  }

  onClickSuggestion(suggestion) {
    searchStore.setShowSearchBar(false);
    controller.clear();
    searchStore.setSuggestions([]);
    if (suggestion is MovieEntity) {
      Modular.to.pushNamed("/movie-details/${suggestion.id}");
    } else {
      Modular.to.pushNamed("/tv-serie-details/${suggestion.id}");
    }
  }
}
