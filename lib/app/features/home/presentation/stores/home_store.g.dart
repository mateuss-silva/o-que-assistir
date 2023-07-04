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

  late final _$getMoviesAsyncAction =
      AsyncAction('HomeStoreBase.getMovies', context: context);

  @override
  Future<void> getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
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
  String toString() {
    return '''
loading: ${loading},
showMovies: ${showMovies},
showMovieOrSeries: ${showMovieOrSeries},
popularMovies: ${popularMovies},
nowPlayingMovies: ${nowPlayingMovies},
topRatedMovies: ${topRatedMovies},
upcomingMovies: ${upcomingMovies}
    ''';
  }
}
