// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/error/failure_extension.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/tv_serie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movies_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_tv_series_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetMoviesUsecase getMoviesUsecase;
  final GetTVSeriesUsecase getTVSeriesUsecase;

  HomeStoreBase(this.getMoviesUsecase, this.getTVSeriesUsecase);

  @observable
  bool _loading = false;

  @observable
  bool _showMovies = true;

  @observable
  bool _showSearchBar = false;

  @computed
  bool get loading => _loading;

  @computed
  bool get showMovies => _showMovies;

  @computed
  bool get showSearchBar => _showSearchBar;

  @computed
  List<bool> get showMovieOrSeries => [showMovies, !showMovies];

  @observable
  ObservableList<MovieEntity> _popularMovies = ObservableList();
  @observable
  ObservableList<MovieEntity> _nowPlayingMovies = ObservableList();
  @observable
  ObservableList<MovieEntity> _topRatedMovies = ObservableList();
  @observable
  ObservableList<MovieEntity> _upcomingMovies = ObservableList();

  @observable
  ObservableList<TVSerieEntity> _popularTVSeries = ObservableList();
  @observable
  ObservableList<TVSerieEntity> _topRatedTVSeries = ObservableList();
  @observable
  ObservableList<TVSerieEntity> _onTheAirTVSeries = ObservableList();
  @observable
  ObservableList<TVSerieEntity> _airingTodayTVSeries = ObservableList();

  @computed
  ObservableList<MovieEntity> get popularMovies => _popularMovies;
  @computed
  ObservableList<MovieEntity> get nowPlayingMovies => _nowPlayingMovies;
  @computed
  ObservableList<MovieEntity> get topRatedMovies => _topRatedMovies;
  @computed
  ObservableList<MovieEntity> get upcomingMovies => _upcomingMovies;

  @computed
  ObservableList<TVSerieEntity> get popularTVSeries => _popularTVSeries;
  @computed
  ObservableList<TVSerieEntity> get topRatedTVSeries => _topRatedTVSeries;
  @computed
  ObservableList<TVSerieEntity> get onTheAirTVSeries => _onTheAirTVSeries;
  @computed
  ObservableList<TVSerieEntity> get airingTodayTVSeries => _airingTodayTVSeries;

  BehaviorSubject<String?> errorMessageStream = BehaviorSubject();

  @action
  Future<void> getMovies() async {
    setLoading(true);

    final popularMoviesFuture =
        getMoviesUsecase(GetMoviesParams(MovieCategory.popular));

    final nowPlayingMoviesFuture =
        getMoviesUsecase(GetMoviesParams(MovieCategory.nowPlaying));

    final topRatedMoviesFuture =
        getMoviesUsecase(GetMoviesParams(MovieCategory.topRated));

    final upcomingMoviesFuture =
        getMoviesUsecase(GetMoviesParams(MovieCategory.upcoming));

    final responses = await Future.wait(
      [
        popularMoviesFuture,
        nowPlayingMoviesFuture,
        topRatedMoviesFuture,
        upcomingMoviesFuture,
      ],
    );

    final popularMoviesResponse = responses[0];
    final nowPlayingMoviesResponse = responses[1];
    final topRatedMoviesResponse = responses[2];
    final upcomingMoviesResponse = responses[3];

    popularMoviesResponse.fold(
      _setErrorMessageFromFailure,
      setPopularMovies,
    );

    nowPlayingMoviesResponse.fold(
      _setErrorMessageFromFailure,
      setNowPlayingMovies,
    );

    topRatedMoviesResponse.fold(
      _setErrorMessageFromFailure,
      setTopRatedMovies,
    );

    upcomingMoviesResponse.fold(
      _setErrorMessageFromFailure,
      setUpcomingMovies,
    );

    setLoading(false);
  }

  @action
  Future<void> getTVSeries() async {
    setLoading(true);

    final popularTVSeriesFuture =
        getTVSeriesUsecase(GetTVSeriesParams(TVSerieCategory.popular));

    final topRatedTVSeriesFuture =
        getTVSeriesUsecase(GetTVSeriesParams(TVSerieCategory.topRated));

    final onTheAirTVSeriesFuture =
        getTVSeriesUsecase(GetTVSeriesParams(TVSerieCategory.onTheAir));

    final airingTodayTVSeriesFuture =
        getTVSeriesUsecase(GetTVSeriesParams(TVSerieCategory.airingToday));

    final responses = await Future.wait(
      [
        popularTVSeriesFuture,
        topRatedTVSeriesFuture,
        onTheAirTVSeriesFuture,
        airingTodayTVSeriesFuture,
      ],
    );

    final popularTVSeriesResponse = responses[0];
    final topRatedTVSeriesResponse = responses[1];
    final onTheAirTVSeriesResponse = responses[2];
    final airingTodayTVSeriesResponse = responses[3];

    popularTVSeriesResponse.fold(
      _setErrorMessageFromFailure,
      setPopularTVSeries,
    );

    topRatedTVSeriesResponse.fold(
      _setErrorMessageFromFailure,
      setTopRatedTVSeries,
    );

    onTheAirTVSeriesResponse.fold(
      _setErrorMessageFromFailure,
      setOnTheAirTVSeries,
    );

    airingTodayTVSeriesResponse.fold(
      _setErrorMessageFromFailure,
      setAiringTodayTVSeries,
    );

    setLoading(false);
  }

  @action
  Future<void> search(String query) async {

  }

  @action
  void setLoading(bool value) => _loading = value;

  @action
  void setShowMovies(bool value) => _showMovies = value;

  void setErrorMessage(String? value) => errorMessageStream.add(value);

  @action
  void setPopularMovies(List<MovieEntity> value) =>
      _popularMovies = value.asObservable();

  @action
  void setNowPlayingMovies(List<MovieEntity> value) =>
      _nowPlayingMovies = value.asObservable();

  @action
  void setTopRatedMovies(List<MovieEntity> value) =>
      _topRatedMovies = value.asObservable();

  @action
  void setUpcomingMovies(List<MovieEntity> value) =>
      _upcomingMovies = value.asObservable();

  @action
  void setPopularTVSeries(List<TVSerieEntity> value) =>
      _popularTVSeries = value.asObservable();

  @action
  void setTopRatedTVSeries(List<TVSerieEntity> value) =>
      _topRatedTVSeries = value.asObservable();

  @action
  void setOnTheAirTVSeries(List<TVSerieEntity> value) =>
      _onTheAirTVSeries = value.asObservable();

  @action
  void setAiringTodayTVSeries(List<TVSerieEntity> value) =>
      _airingTodayTVSeries = value.asObservable();

  @action
  _setErrorMessageFromFailure(Failure failure) =>
      setErrorMessage(failure.message);
  
  @action
  void setShowSearchBar(bool value) => _showSearchBar = value;
}
