// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_serie_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TVSerieDetailsStore on TVSerieDetailsStoreBase, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: 'TVSerieDetailsStoreBase.loading'))
      .value;
  Computed<TVSerieEntity>? _$tvSerieComputed;

  @override
  TVSerieEntity get tvSerie =>
      (_$tvSerieComputed ??= Computed<TVSerieEntity>(() => super.tvSerie,
              name: 'TVSerieDetailsStoreBase.tvSerie'))
          .value;
  Computed<ObservableList<ActorEntity>>? _$castComputed;

  @override
  ObservableList<ActorEntity> get cast => (_$castComputed ??=
          Computed<ObservableList<ActorEntity>>(() => super.cast,
              name: 'TVSerieDetailsStoreBase.cast'))
      .value;

  late final _$_loadingAtom =
      Atom(name: 'TVSerieDetailsStoreBase._loading', context: context);

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

  late final _$_tvSerieAtom =
      Atom(name: 'TVSerieDetailsStoreBase._tvSerie', context: context);

  @override
  TVSerieEntity? get _tvSerie {
    _$_tvSerieAtom.reportRead();
    return super._tvSerie;
  }

  @override
  set _tvSerie(TVSerieEntity? value) {
    _$_tvSerieAtom.reportWrite(value, super._tvSerie, () {
      super._tvSerie = value;
    });
  }

  late final _$_castAtom =
      Atom(name: 'TVSerieDetailsStoreBase._cast', context: context);

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

  late final _$getTVSerieAsyncAction =
      AsyncAction('TVSerieDetailsStoreBase.getTVSerie', context: context);

  @override
  Future<void> getTVSerie(int id) {
    return _$getTVSerieAsyncAction.run(() => super.getTVSerie(id));
  }

  late final _$TVSerieDetailsStoreBaseActionController =
      ActionController(name: 'TVSerieDetailsStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$TVSerieDetailsStoreBaseActionController.startAction(
        name: 'TVSerieDetailsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$TVSerieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTVSerie(TVSerieEntity value) {
    final _$actionInfo = _$TVSerieDetailsStoreBaseActionController.startAction(
        name: 'TVSerieDetailsStoreBase.setTVSerie');
    try {
      return super.setTVSerie(value);
    } finally {
      _$TVSerieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCast(List<ActorEntity> value) {
    final _$actionInfo = _$TVSerieDetailsStoreBaseActionController.startAction(
        name: 'TVSerieDetailsStoreBase.setCast');
    try {
      return super.setCast(value);
    } finally {
      _$TVSerieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setErrorMessageFromFailure(Failure failure) {
    final _$actionInfo = _$TVSerieDetailsStoreBaseActionController.startAction(
        name: 'TVSerieDetailsStoreBase._setErrorMessageFromFailure');
    try {
      return super._setErrorMessageFromFailure(failure);
    } finally {
      _$TVSerieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
tvSerie: ${tvSerie},
cast: ${cast}
    ''';
  }
}
