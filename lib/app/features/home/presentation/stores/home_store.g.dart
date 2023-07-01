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
  Computed<ObservableList<MovieEntity>>? _$moviesComputed;

  @override
  ObservableList<MovieEntity> get movies => (_$moviesComputed ??=
          Computed<ObservableList<MovieEntity>>(() => super.movies,
              name: 'HomeStoreBase.movies'))
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
movies: ${movies}
    ''';
  }
}
