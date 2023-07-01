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
  ObservableList<MovieEntity> _movies = ObservableList();

  @computed
  ObservableList<MovieEntity> get movies => _movies;

  // ignore: prefer_final_fields
  BehaviorSubject<String?> errorMessageStream = BehaviorSubject();

  @action
  Future<void> getMovies() async {
    setLoading(true);
    setErrorMessage(null);

    final moviesResponse =
        await getMoviesUsecase(GetMoviesParams(MovieCategory.popular));

    moviesResponse.fold(
      _setErrorMessageFromFailure,
      setMovies,
    );

    setLoading(false);
  }

  @action
  void setLoading(bool value) => _loading = value;

  void setErrorMessage(String? value) => errorMessageStream.add(value);

  @action
  void setMovies(List<MovieEntity> value) => _movies = value.asObservable();

  @action
  _setErrorMessageFromFailure(Failure failure) =>
      setErrorMessage(failure.message);
}
