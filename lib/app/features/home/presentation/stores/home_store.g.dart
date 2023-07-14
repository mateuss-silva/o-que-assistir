// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: 'HomeStoreBase.loading'))
      .value;
  Computed<bool>? _$showMoviesComputed;

  @override
  bool get showMovies =>
      (_$showMoviesComputed ??= Computed<bool>(() => super.showMovies,
              name: 'HomeStoreBase.showMovies'))
          .value;
  Computed<bool>? _$showSearchBarComputed;

  @override
  bool get showSearchBar =>
      (_$showSearchBarComputed ??= Computed<bool>(() => super.showSearchBar,
              name: 'HomeStoreBase.showSearchBar'))
          .value;
  Computed<bool>? _$searchingSuggestionsComputed;

  @override
  bool get searchingSuggestions => (_$searchingSuggestionsComputed ??=
          Computed<bool>(() => super.searchingSuggestions,
              name: 'HomeStoreBase.searchingSuggestions'))
      .value;
  Computed<List<bool>>? _$showMovieOrSeriesComputed;

  @override
  List<bool> get showMovieOrSeries => (_$showMovieOrSeriesComputed ??=
          Computed<List<bool>>(() => super.showMovieOrSeries,
              name: 'HomeStoreBase.showMovieOrSeries'))
      .value;
  Computed<ObservableList<MovieEntity>>? _$popularMoviesComputed;

  @override
  ObservableList<MovieEntity> get popularMovies => (_$popularMoviesComputed ??=
          Computed<ObservableList<MovieEntity>>(() => super.popularMovies,
              name: 'HomeStoreBase.popularMovies'))
      .value;
  Computed<ObservableList<MovieEntity>>? _$topRatedMoviesComputed;

  @override
  ObservableList<MovieEntity> get topRatedMovies =>
      (_$topRatedMoviesComputed ??= Computed<ObservableList<MovieEntity>>(
              () => super.topRatedMovies,
              name: 'HomeStoreBase.topRatedMovies'))
          .value;
  Computed<ObservableList<MovieEntity>>? _$nowPlayingMoviesComputed;

  @override
  ObservableList<MovieEntity> get nowPlayingMovies =>
      (_$nowPlayingMoviesComputed ??= Computed<ObservableList<MovieEntity>>(
              () => super.nowPlayingMovies,
              name: 'HomeStoreBase.nowPlayingMovies'))
          .value;
  Computed<ObservableList<MovieEntity>>? _$upcomingMoviesComputed;

  @override
  ObservableList<MovieEntity> get upcomingMovies =>
      (_$upcomingMoviesComputed ??= Computed<ObservableList<MovieEntity>>(
              () => super.upcomingMovies,
              name: 'HomeStoreBase.upcomingMovies'))
          .value;
  Computed<ObservableList<TVSerieEntity>>? _$popularTVSeriesComputed;

  @override
  ObservableList<TVSerieEntity> get popularTVSeries =>
      (_$popularTVSeriesComputed ??= Computed<ObservableList<TVSerieEntity>>(
              () => super.popularTVSeries,
              name: 'HomeStoreBase.popularTVSeries'))
          .value;
  Computed<ObservableList<TVSerieEntity>>? _$topRatedTVSeriesComputed;

  @override
  ObservableList<TVSerieEntity> get topRatedTVSeries =>
      (_$topRatedTVSeriesComputed ??= Computed<ObservableList<TVSerieEntity>>(
              () => super.topRatedTVSeries,
              name: 'HomeStoreBase.topRatedTVSeries'))
          .value;
  Computed<ObservableList<TVSerieEntity>>? _$airingTodayTVSeriesComputed;

  @override
  ObservableList<TVSerieEntity> get airingTodayTVSeries =>
      (_$airingTodayTVSeriesComputed ??=
              Computed<ObservableList<TVSerieEntity>>(
                  () => super.airingTodayTVSeries,
                  name: 'HomeStoreBase.airingTodayTVSeries'))
          .value;
  Computed<ObservableList<TVSerieEntity>>? _$onTheAirTVSeriesComputed;

  @override
  ObservableList<TVSerieEntity> get onTheAirTVSeries =>
      (_$onTheAirTVSeriesComputed ??= Computed<ObservableList<TVSerieEntity>>(
              () => super.onTheAirTVSeries,
              name: 'HomeStoreBase.onTheAirTVSeries'))
          .value;
  Computed<ObservableList<dynamic>>? _$suggestionsComputed;

  @override
  ObservableList<dynamic> get suggestions => (_$suggestionsComputed ??=
          Computed<ObservableList<dynamic>>(() => super.suggestions,
              name: 'HomeStoreBase.suggestions'))
      .value;

  late final _$_loadingAtom =
      Atom(name: 'HomeStoreBase._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_showMoviesAtom =
      Atom(name: 'HomeStoreBase._showMovies', context: context);

  @override
  bool get _showMovies {
    _$_showMoviesAtom.reportRead();
    return super._showMovies;
  }

  @override
  set _showMovies(bool value) {
    _$_showMoviesAtom.reportWrite(value, super._showMovies, () {
      super._showMovies = value;
    });
  }

  late final _$_showSearchBarAtom =
      Atom(name: 'HomeStoreBase._showSearchBar', context: context);

  @override
  bool get _showSearchBar {
    _$_showSearchBarAtom.reportRead();
    return super._showSearchBar;
  }

  @override
  set _showSearchBar(bool value) {
    _$_showSearchBarAtom.reportWrite(value, super._showSearchBar, () {
      super._showSearchBar = value;
    });
  }

  late final _$_searchingSuggestionsAtom =
      Atom(name: 'HomeStoreBase._searchingSuggestions', context: context);

  @override
  bool get _searchingSuggestions {
    _$_searchingSuggestionsAtom.reportRead();
    return super._searchingSuggestions;
  }

  @override
  set _searchingSuggestions(bool value) {
    _$_searchingSuggestionsAtom.reportWrite(value, super._searchingSuggestions,
        () {
      super._searchingSuggestions = value;
    });
  }

  late final _$_moviesAtom =
      Atom(name: 'HomeStoreBase._movies', context: context);

  @override
  ObservableList<MovieEntity> get _movies {
    _$_moviesAtom.reportRead();
    return super._movies;
  }

  @override
  set _movies(ObservableList<MovieEntity> value) {
    _$_moviesAtom.reportWrite(value, super._movies, () {
      super._movies = value;
    });
  }

  late final _$_tvSeriesAtom =
      Atom(name: 'HomeStoreBase._tvSeries', context: context);

  @override
  ObservableList<TVSerieEntity> get _tvSeries {
    _$_tvSeriesAtom.reportRead();
    return super._tvSeries;
  }

  @override
  set _tvSeries(ObservableList<TVSerieEntity> value) {
    _$_tvSeriesAtom.reportWrite(value, super._tvSeries, () {
      super._tvSeries = value;
    });
  }

  late final _$_suggestionsAtom =
      Atom(name: 'HomeStoreBase._suggestions', context: context);

  @override
  ObservableList<MediaEntity> get _suggestions {
    _$_suggestionsAtom.reportRead();
    return super._suggestions;
  }

  @override
  set _suggestions(ObservableList<MediaEntity> value) {
    _$_suggestionsAtom.reportWrite(value, super._suggestions, () {
      super._suggestions = value;
    });
  }

  late final _$getMoviesAsyncAction =
      AsyncAction('HomeStoreBase.getMovies', context: context);

  @override
  Future<void> getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  late final _$getTVSeriesAsyncAction =
      AsyncAction('HomeStoreBase.getTVSeries', context: context);

  @override
  Future<void> getTVSeries() {
    return _$getTVSeriesAsyncAction.run(() => super.getTVSeries());
  }

  late final _$searchAsyncAction =
      AsyncAction('HomeStoreBase.search', context: context);

  @override
  Future<void> search(String query) {
    return _$searchAsyncAction.run(() => super.search(query));
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowMovies(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setShowMovies');
    try {
      return super.setShowMovies(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovies(List<MovieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setMovies');
    try {
      return super.setMovies(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTVSeries(List<TVSerieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setTVSeries');
    try {
      return super.setTVSeries(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuggestions(List<MediaEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSuggestions');
    try {
      return super.setSuggestions(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearMovies() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.clearMovies');
    try {
      return super.clearMovies();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTVSeries() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.clearTVSeries');
    try {
      return super.clearTVSeries();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setErrorMessageFromFailure(Failure failure) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase._setErrorMessageFromFailure');
    try {
      return super._setErrorMessageFromFailure(failure);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowSearchBar(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setShowSearchBar');
    try {
      return super.setShowSearchBar(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchingSuggestions(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSearchingSuggestions');
    try {
      return super.setSearchingSuggestions(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
showMovies: ${showMovies},
showSearchBar: ${showSearchBar},
searchingSuggestions: ${searchingSuggestions},
showMovieOrSeries: ${showMovieOrSeries},
popularMovies: ${popularMovies},
topRatedMovies: ${topRatedMovies},
nowPlayingMovies: ${nowPlayingMovies},
upcomingMovies: ${upcomingMovies},
popularTVSeries: ${popularTVSeries},
topRatedTVSeries: ${topRatedTVSeries},
airingTodayTVSeries: ${airingTodayTVSeries},
onTheAirTVSeries: ${onTheAirTVSeries},
suggestions: ${suggestions}
    ''';
  }
}
