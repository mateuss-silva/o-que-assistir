// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/error/failure_extension.dart';
import 'package:o_que_assistir/app/features/home/data/datasources/movie_data_source.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movies_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetMoviesUsecase getMoviesUsecase;

  HomeStoreBase(this.getMoviesUsecase);

  @observable
  bool _loading = false;

  @computed
  bool get loading => _loading;

  @observable
  ObservableList<MovieEntity> _popularMovies = ObservableList();

  @observable
  ObservableList<MovieEntity> _nowPlayingMovies = ObservableList();

  @observable
  ObservableList<MovieEntity> _topRatedMovies = ObservableList();

  @observable
  ObservableList<MovieEntity> _upcomingMovies = ObservableList();

  @computed
  ObservableList<MovieEntity> get popularMovies => _popularMovies;

  @computed
  ObservableList<MovieEntity> get nowPlayingMovies => _nowPlayingMovies;

  @computed
  ObservableList<MovieEntity> get topRatedMovies => _topRatedMovies;

  @computed
  ObservableList<MovieEntity> get upcomingMovies => _upcomingMovies;

  BehaviorSubject<String?> errorMessageStream = BehaviorSubject();

  @action
  Future<void> getMovies() async {
    setLoading(true);
    setErrorMessage(null);

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
  void setLoading(bool value) => _loading = value;

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
  _setErrorMessageFromFailure(Failure failure) =>
      setErrorMessage(failure.message);
}
