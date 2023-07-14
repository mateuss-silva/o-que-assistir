// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on _SearchStoreBase, Store {
  Computed<bool>? _$showSearchBarComputed;

  @override
  bool get showSearchBar =>
      (_$showSearchBarComputed ??= Computed<bool>(() => super.showSearchBar,
              name: '_SearchStoreBase.showSearchBar'))
          .value;
  Computed<bool>? _$searchingSuggestionsComputed;

  @override
  bool get searchingSuggestions => (_$searchingSuggestionsComputed ??=
          Computed<bool>(() => super.searchingSuggestions,
              name: '_SearchStoreBase.searchingSuggestions'))
      .value;
  Computed<ObservableList<dynamic>>? _$suggestionsComputed;

  @override
  ObservableList<dynamic> get suggestions => (_$suggestionsComputed ??=
          Computed<ObservableList<dynamic>>(() => super.suggestions,
              name: '_SearchStoreBase.suggestions'))
      .value;

  late final _$_showSearchBarAtom =
      Atom(name: '_SearchStoreBase._showSearchBar', context: context);

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
      Atom(name: '_SearchStoreBase._searchingSuggestions', context: context);

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

  late final _$_suggestionsAtom =
      Atom(name: '_SearchStoreBase._suggestions', context: context);

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

  late final _$searchAsyncAction =
      AsyncAction('_SearchStoreBase.search', context: context);

  @override
  Future<void> search(String query, dynamic Function(Failure) onError) {
    return _$searchAsyncAction.run(() => super.search(query, onError));
  }

  late final _$_SearchStoreBaseActionController =
      ActionController(name: '_SearchStoreBase', context: context);

  @override
  void setShowSearchBar(bool value) {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.setShowSearchBar');
    try {
      return super.setShowSearchBar(value);
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchingSuggestions(bool value) {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.setSearchingSuggestions');
    try {
      return super.setSearchingSuggestions(value);
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSuggestions(List<MediaEntity> value) {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.setSuggestions');
    try {
      return super.setSuggestions(value);
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSearchBar: ${showSearchBar},
searchingSuggestions: ${searchingSuggestions},
suggestions: ${suggestions}
    ''';
  }
}
