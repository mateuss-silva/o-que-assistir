import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/core/common/constants.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';
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
  late final HomeStore store;
  late final AnimationController fadeController;
  late final Animation<double> animation;

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();

    store.getMovies();

    store.errorMessageStream.listen(_showErrorMessage);

    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(fadeController);
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
          SliverAppBar(
            expandedHeight: 150.0,
            centerTitle: true,
            pinned: true,
            surfaceTintColor: Theme.of(context).colorScheme.background,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1,
              titlePadding: const EdgeInsets.all(8),
              title: Observer(builder: (_) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeOut,
                  child: store.showSearchBar
                      ? SearchBarWidget(
                          onSearch: store.search,
                          onSubmitted: () {
                            store.setShowSearchBar(false);
                            fadeController.reverse();
                          },
                          controller: controller,
                        )
                      : Align(
                          alignment: Alignment.bottomLeft,
                          child: IconButton.filled(
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                            ),
                            onPressed: () {
                              store.setShowSearchBar(true);
                              fadeController.forward();
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                );
              }),
              background: Image.network(
                searchBackdropImage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    Column(
                      children: [
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
                    Observer(builder: (_) {
                      return Visibility(
                        visible: store.showSearchBar,
                        child: FadeTransition(
                          opacity: animation,
                          child: SearchSuggestionsWidget(
                            suggestions: store.popularMovies,
                            onSuggestionSelected: (suggestion) {
                              store.setShowSearchBar(false);
                              if (suggestion is MovieEntity) {
                                Modular.to.pushNamed(
                                    "/movie-details/${suggestion.id}");
                              } else if (suggestion is TVSerieEntity) {
                                Modular.to.pushNamed(
                                    "/tv-serie-details/${suggestion.id}");
                              }
                            },
                          ),
                        ),
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
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
}
