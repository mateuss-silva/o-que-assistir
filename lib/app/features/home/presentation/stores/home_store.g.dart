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
  Computed<MovieEntity?>? _$movieComputed;

  @override
  MovieEntity? get movie =>
      (_$movieComputed ??= Computed<MovieEntity?>(() => super.movie,
              name: 'HomeStoreBase.movie'))
          .value;
  Computed<String?>? _$errorMessageComputed;

  @override
  String? get errorMessage =>
      (_$errorMessageComputed ??= Computed<String?>(() => super.errorMessage,
              name: 'HomeStoreBase.errorMessage'))
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

  late final _$_movieAtom =
      Atom(name: 'HomeStoreBase._movie', context: context);

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

  late final _$_errorMessageAtom =
      Atom(name: 'HomeStoreBase._errorMessage', context: context);

  @override
  String? get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$getMovieAsyncAction =
      AsyncAction('HomeStoreBase.getMovie', context: context);

  @override
  Future<void> getMovie(int id) {
    return _$getMovieAsyncAction.run(() => super.getMovie(id));
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
  void setErrorMessage(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setErrorMessage');
    try {
      return super.setErrorMessage(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMovie(MovieEntity value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setMovie');
    try {
      return super.setMovie(value);
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
movie: ${movie},
errorMessage: ${errorMessage}
    ''';
  }
}
