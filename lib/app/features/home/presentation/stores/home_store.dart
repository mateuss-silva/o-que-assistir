// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/error/failure_extension.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/tv_serie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/media_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movies_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_suggestions_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_tv_series_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetMoviesUsecase getMoviesUsecase;
  final GetTVSeriesUsecase getTVSeriesUsecase;
  final GetSuggestionsUsecase getSuggestionsUsecase;

  HomeStoreBase(
    this.getMoviesUsecase,
    this.getTVSeriesUsecase,
    this.getSuggestionsUsecase,
  );

  @observable
  bool _loading = false;

  @observable
  bool _showMovies = true;

  @observable
  bool _showSearchBar = false;

  @observable
  bool _searchingSuggestions = false;

  @computed
  bool get loading => _loading;

  @computed
  bool get showMovies => _showMovies;

  @computed
  bool get showSearchBar => _showSearchBar;

  @computed
  bool get searchingSuggestions => _searchingSuggestions;

  @computed
  List<bool> get showMovieOrSeries => [showMovies, !showMovies];

  @observable
  ObservableList<MovieEntity> _movies = ObservableList();
  @observable
  ObservableList<TVSerieEntity> _tvSeries = ObservableList();
  @observable
  ObservableList<MediaEntity> _suggestions = ObservableList();

  @computed
  ObservableList<MovieEntity> get popularMovies =>
      MovieEntity.byCategory(_movies, MovieCategory.popular).asObservable();
  @computed
  ObservableList<MovieEntity> get topRatedMovies =>
      MovieEntity.byCategory(_movies, MovieCategory.topRated).asObservable();
  @computed
  ObservableList<MovieEntity> get nowPlayingMovies =>
      MovieEntity.byCategory(_movies, MovieCategory.nowPlaying).asObservable();
  @computed
  ObservableList<MovieEntity> get upcomingMovies =>
      MovieEntity.byCategory(_movies, MovieCategory.upcoming).asObservable();

  @computed
  ObservableList<TVSerieEntity> get popularTVSeries =>
      TVSerieEntity.byCategory(_tvSeries, TVSerieCategory.popular)
          .asObservable();
  @computed
  ObservableList<TVSerieEntity> get topRatedTVSeries =>
      TVSerieEntity.byCategory(_tvSeries, TVSerieCategory.topRated)
          .asObservable();
  @computed
  ObservableList<TVSerieEntity> get airingTodayTVSeries =>
      TVSerieEntity.byCategory(_tvSeries, TVSerieCategory.airingToday)
          .asObservable();
  @computed
  ObservableList<TVSerieEntity> get onTheAirTVSeries =>
      TVSerieEntity.byCategory(_tvSeries, TVSerieCategory.onTheAir)
          .asObservable();

  @computed
  ObservableList get suggestions => _suggestions;

  BehaviorSubject<String?> errorMessageStream = BehaviorSubject();

  @action
  Future<void> getMovies() async {
    setLoading(true);
    clearMovies();

    handleMoviesResponse(await moviesRequest());

    setLoading(false);
  }

  handleMoviesResponse(List<Either<Failure, List<MovieEntity>>> responses) {
    for (var response in responses) {
      response.fold(_setErrorMessageFromFailure, setMovies);
    }
  }

  Future<List<Either<Failure, List<MovieEntity>>>> moviesRequest() {
    return Future.wait(
      [
        getMoviesUsecase(GetMoviesParams(MovieCategory.popular)),
        getMoviesUsecase(GetMoviesParams(MovieCategory.nowPlaying)),
        getMoviesUsecase(GetMoviesParams(MovieCategory.topRated)),
        getMoviesUsecase(GetMoviesParams(MovieCategory.upcoming)),
      ],
    );
  }

  @action
  Future<void> getTVSeries() async {
    setLoading(true);
    clearTVSeries();

    handleTVSeriesResponse(await tvSeriesRequest());

    setLoading(false);
  }

  handleTVSeriesResponse(List<Either<Failure, List<TVSerieEntity>>> responses) {
    for (var response in responses) {
      response.fold(_setErrorMessageFromFailure, setTVSeries);
    }
  }

  tvSeriesRequest() {
    return Future.wait(
      [
        getTVSeriesUsecase(GetTVSeriesParams(TVSerieCategory.popular)),
        getTVSeriesUsecase(GetTVSeriesParams(TVSerieCategory.topRated)),
        getTVSeriesUsecase(GetTVSeriesParams(TVSerieCategory.onTheAir)),
        getTVSeriesUsecase(GetTVSeriesParams(TVSerieCategory.airingToday)),
      ],
    );
  }

  @action
  Future<void> search(String query) async {
    setSearchingSuggestions(true);

    final suggestionsResponse =
        await getSuggestionsUsecase(GetSuggestionsParams(query: query));

    suggestionsResponse.fold(
      _setErrorMessageFromFailure,
      setSuggestions,
    );

    setSearchingSuggestions(false);
  }

  @action
  void setLoading(bool value) => _loading = value;

  @action
  void setShowMovies(bool value) => _showMovies = value;

  void setErrorMessage(String? value) => errorMessageStream.add(value);

  @action
  void setMovies(List<MovieEntity> value) => _movies.addAll(value);
  @action
  void setTVSeries(List<TVSerieEntity> value) => _tvSeries.addAll(value);
  @action
  void setSuggestions(List<MediaEntity> value) =>
      _suggestions = value.asObservable();

  @action
  void clearMovies() => _movies.clear();
  @action
  void clearTVSeries() => _tvSeries.clear();

  @action
  _setErrorMessageFromFailure(Failure failure) =>
      setErrorMessage(failure.message);

  @action
  void setShowSearchBar(bool value) => _showSearchBar = value;

  @action
  void setSearchingSuggestions(bool value) => _searchingSuggestions = value;
}
