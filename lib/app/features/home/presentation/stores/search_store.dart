import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_suggestions_usecase.dart';
part 'search_store.g.dart';

// ignore: library_private_types_in_public_api
class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  final GetSuggestionsUsecase getSuggestionsUsecase;

  _SearchStoreBase(this.getSuggestionsUsecase);

  @observable
  bool _showSearchBar = false;

  @observable
  bool _searchingSuggestions = false;

  @observable
  ObservableList<MediaEntity> _suggestions = ObservableList();

  @computed
  bool get showSearchBar => _showSearchBar;

  @computed
  bool get searchingSuggestions => _searchingSuggestions;

  @computed
  ObservableList get suggestions => _suggestions;

  @action
  Future<void> search(String query, Function(Failure) onError) async {
    setSearchingSuggestions(true);

    (await searchRequest(query)).fold(
      onError,
      setSuggestions,
    );

    setSearchingSuggestions(false);
  }

  Future<Either<Failure, List<MediaEntity>>> searchRequest(String query) {
    return getSuggestionsUsecase(GetSuggestionsParams(query: query));
  }

  @action
  void initSearch() {
    setSuggestions([]);
    setShowSearchBar(true);
  }

  @action
  void closeSearch() {
    setSuggestions([]);
    setShowSearchBar(false);
  }

  @action
  void setShowSearchBar(bool value) => _showSearchBar = value;

  @action
  void setSearchingSuggestions(bool value) => _searchingSuggestions = value;

  @action
  void setSuggestions(List<MediaEntity> value) =>
      _suggestions = value.asObservable();
}
