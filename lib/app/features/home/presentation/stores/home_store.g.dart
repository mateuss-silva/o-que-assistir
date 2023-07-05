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
  Computed<ObservableList<MovieEntity>>? _$nowPlayingMoviesComputed;

  @override
  ObservableList<MovieEntity> get nowPlayingMovies =>
      (_$nowPlayingMoviesComputed ??= Computed<ObservableList<MovieEntity>>(
              () => super.nowPlayingMovies,
              name: 'HomeStoreBase.nowPlayingMovies'))
          .value;
  Computed<ObservableList<MovieEntity>>? _$topRatedMoviesComputed;

  @override
  ObservableList<MovieEntity> get topRatedMovies =>
      (_$topRatedMoviesComputed ??= Computed<ObservableList<MovieEntity>>(
              () => super.topRatedMovies,
              name: 'HomeStoreBase.topRatedMovies'))
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
  Computed<ObservableList<TVSerieEntity>>? _$onTheAirTVSeriesComputed;

  @override
  ObservableList<TVSerieEntity> get onTheAirTVSeries =>
      (_$onTheAirTVSeriesComputed ??= Computed<ObservableList<TVSerieEntity>>(
              () => super.onTheAirTVSeries,
              name: 'HomeStoreBase.onTheAirTVSeries'))
          .value;
  Computed<ObservableList<TVSerieEntity>>? _$airingTodayTVSeriesComputed;

  @override
  ObservableList<TVSerieEntity> get airingTodayTVSeries =>
      (_$airingTodayTVSeriesComputed ??=
              Computed<ObservableList<TVSerieEntity>>(
                  () => super.airingTodayTVSeries,
                  name: 'HomeStoreBase.airingTodayTVSeries'))
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

  late final _$_popularMoviesAtom =
      Atom(name: 'HomeStoreBase._popularMovies', context: context);

  @override
  ObservableList<MovieEntity> get _popularMovies {
    _$_popularMoviesAtom.reportRead();
    return super._popularMovies;
  }

  @override
  set _popularMovies(ObservableList<MovieEntity> value) {
    _$_popularMoviesAtom.reportWrite(value, super._popularMovies, () {
      super._popularMovies = value;
    });
  }

  late final _$_nowPlayingMoviesAtom =
      Atom(name: 'HomeStoreBase._nowPlayingMovies', context: context);

  @override
  ObservableList<MovieEntity> get _nowPlayingMovies {
    _$_nowPlayingMoviesAtom.reportRead();
    return super._nowPlayingMovies;
  }

  @override
  set _nowPlayingMovies(ObservableList<MovieEntity> value) {
    _$_nowPlayingMoviesAtom.reportWrite(value, super._nowPlayingMovies, () {
      super._nowPlayingMovies = value;
    });
  }

  late final _$_topRatedMoviesAtom =
      Atom(name: 'HomeStoreBase._topRatedMovies', context: context);

  @override
  ObservableList<MovieEntity> get _topRatedMovies {
    _$_topRatedMoviesAtom.reportRead();
    return super._topRatedMovies;
  }

  @override
  set _topRatedMovies(ObservableList<MovieEntity> value) {
    _$_topRatedMoviesAtom.reportWrite(value, super._topRatedMovies, () {
      super._topRatedMovies = value;
    });
  }

  late final _$_upcomingMoviesAtom =
      Atom(name: 'HomeStoreBase._upcomingMovies', context: context);

  @override
  ObservableList<MovieEntity> get _upcomingMovies {
    _$_upcomingMoviesAtom.reportRead();
    return super._upcomingMovies;
  }

  @override
  set _upcomingMovies(ObservableList<MovieEntity> value) {
    _$_upcomingMoviesAtom.reportWrite(value, super._upcomingMovies, () {
      super._upcomingMovies = value;
    });
  }

  late final _$_popularTVSeriesAtom =
      Atom(name: 'HomeStoreBase._popularTVSeries', context: context);

  @override
  ObservableList<TVSerieEntity> get _popularTVSeries {
    _$_popularTVSeriesAtom.reportRead();
    return super._popularTVSeries;
  }

  @override
  set _popularTVSeries(ObservableList<TVSerieEntity> value) {
    _$_popularTVSeriesAtom.reportWrite(value, super._popularTVSeries, () {
      super._popularTVSeries = value;
    });
  }

  late final _$_topRatedTVSeriesAtom =
      Atom(name: 'HomeStoreBase._topRatedTVSeries', context: context);

  @override
  ObservableList<TVSerieEntity> get _topRatedTVSeries {
    _$_topRatedTVSeriesAtom.reportRead();
    return super._topRatedTVSeries;
  }

  @override
  set _topRatedTVSeries(ObservableList<TVSerieEntity> value) {
    _$_topRatedTVSeriesAtom.reportWrite(value, super._topRatedTVSeries, () {
      super._topRatedTVSeries = value;
    });
  }

  late final _$_onTheAirTVSeriesAtom =
      Atom(name: 'HomeStoreBase._onTheAirTVSeries', context: context);

  @override
  ObservableList<TVSerieEntity> get _onTheAirTVSeries {
    _$_onTheAirTVSeriesAtom.reportRead();
    return super._onTheAirTVSeries;
  }

  @override
  set _onTheAirTVSeries(ObservableList<TVSerieEntity> value) {
    _$_onTheAirTVSeriesAtom.reportWrite(value, super._onTheAirTVSeries, () {
      super._onTheAirTVSeries = value;
    });
  }

  late final _$_airingTodayTVSeriesAtom =
      Atom(name: 'HomeStoreBase._airingTodayTVSeries', context: context);

  @override
  ObservableList<TVSerieEntity> get _airingTodayTVSeries {
    _$_airingTodayTVSeriesAtom.reportRead();
    return super._airingTodayTVSeries;
  }

  @override
  set _airingTodayTVSeries(ObservableList<TVSerieEntity> value) {
    _$_airingTodayTVSeriesAtom.reportWrite(value, super._airingTodayTVSeries,
        () {
      super._airingTodayTVSeries = value;
    });
  }

  late final _$_suggestionsAtom =
      Atom(name: 'HomeStoreBase._suggestions', context: context);

  @override
  ObservableList<dynamic> get _suggestions {
    _$_suggestionsAtom.reportRead();
    return super._suggestions;
  }

  @override
  set _suggestions(ObservableList<dynamic> value) {
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
  void setPopularMovies(List<MovieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setPopularMovies');
    try {
      return super.setPopularMovies(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNowPlayingMovies(List<MovieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setNowPlayingMovies');
    try {
      return super.setNowPlayingMovies(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTopRatedMovies(List<MovieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setTopRatedMovies');
    try {
      return super.setTopRatedMovies(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUpcomingMovies(List<MovieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setUpcomingMovies');
    try {
      return super.setUpcomingMovies(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPopularTVSeries(List<TVSerieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setPopularTVSeries');
    try {
      return super.setPopularTVSeries(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTopRatedTVSeries(List<TVSerieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setTopRatedTVSeries');
    try {
      return super.setTopRatedTVSeries(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOnTheAirTVSeries(List<TVSerieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setOnTheAirTVSeries');
    try {
      return super.setOnTheAirTVSeries(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAiringTodayTVSeries(List<TVSerieEntity> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setAiringTodayTVSeries');
    try {
      return super.setAiringTodayTVSeries(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuggestions(List<dynamic> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSuggestions');
    try {
      return super.setSuggestions(value);
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
nowPlayingMovies: ${nowPlayingMovies},
topRatedMovies: ${topRatedMovies},
upcomingMovies: ${upcomingMovies},
popularTVSeries: ${popularTVSeries},
topRatedTVSeries: ${topRatedTVSeries},
onTheAirTVSeries: ${onTheAirTVSeries},
airingTodayTVSeries: ${airingTodayTVSeries},
suggestions: ${suggestions}
    ''';
  }
}
