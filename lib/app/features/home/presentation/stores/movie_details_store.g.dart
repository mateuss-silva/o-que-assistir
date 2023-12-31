// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieDetailsStore on MovieDetailsStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: 'MovieDetailsStoreBase.loading'))
      .value;
  Computed<MovieEntity>? _$movieComputed;

  @override
  MovieEntity get movie =>
      (_$movieComputed ??= Computed<MovieEntity>(() => super.movie,
              name: 'MovieDetailsStoreBase.movie'))
          .value;
  Computed<ObservableList<ActorEntity>>? _$castComputed;

  @override
  ObservableList<ActorEntity> get cast => (_$castComputed ??=
          Computed<ObservableList<ActorEntity>>(() => super.cast,
              name: 'MovieDetailsStoreBase.cast'))
      .value;

  late final _$_loadingAtom =
      Atom(name: 'MovieDetailsStoreBase._loading', context: context);

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

  late final _$_movieAtom =
      Atom(name: 'MovieDetailsStoreBase._movie', context: context);

  @override
  MovieEntity? get _movie {
    _$_movieAtom.reportRead();
    return super._movie;
  }

  @override
  set _movie(MovieEntity? value) {
    _$_movieAtom.reportWrite(value, super._movie, () {
      super._movie = value;
    });
  }

  late final _$_castAtom =
      Atom(name: 'MovieDetailsStoreBase._cast', context: context);

  @override
  ObservableList<ActorEntity> get _cast {
    _$_castAtom.reportRead();
    return super._cast;
  }

  @override
  set _cast(ObservableList<ActorEntity> value) {
    _$_castAtom.reportWrite(value, super._cast, () {
      super._cast = value;
    });
  }

  late final _$getMovieAsyncAction =
      AsyncAction('MovieDetailsStoreBase.getMovie', context: context);

  @override
  Future<void> getMovie(int id) {
    return _$getMovieAsyncAction.run(() => super.getMovie(id));
  }

  late final _$MovieDetailsStoreBaseActionController =
      ActionController(name: 'MovieDetailsStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$MovieDetailsStoreBaseActionController.startAction(
        name: 'MovieDetailsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$MovieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovie(MovieEntity value) {
    final _$actionInfo = _$MovieDetailsStoreBaseActionController.startAction(
        name: 'MovieDetailsStoreBase.setMovie');
    try {
      return super.setMovie(value);
    } finally {
      _$MovieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCast(List<ActorEntity> value) {
    final _$actionInfo = _$MovieDetailsStoreBaseActionController.startAction(
        name: 'MovieDetailsStoreBase.setCast');
    try {
      return super.setCast(value);
    } finally {
      _$MovieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setErrorMessageFromFailure(Failure failure) {
    final _$actionInfo = _$MovieDetailsStoreBaseActionController.startAction(
        name: 'MovieDetailsStoreBase._setErrorMessageFromFailure');
    try {
      return super._setErrorMessageFromFailure(failure);
    } finally {
      _$MovieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
movie: ${movie},
cast: ${cast}
    ''';
  }
}
