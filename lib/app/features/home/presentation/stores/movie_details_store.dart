// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/error/failure_extension.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_cast_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movie_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'movie_details_store.g.dart';

class MovieDetailsStore = MovieDetailsStoreBase with _$MovieDetailsStore;

abstract class MovieDetailsStoreBase with Store {
  final GetMovieUsecase getMovieUsecase;
  final GetCastUsecase getCastUsecase;

  MovieDetailsStoreBase(this.getMovieUsecase, this.getCastUsecase);

  @observable
  bool _loading = false;

  @computed
  bool get loading => _loading;

  @observable
  MovieEntity? _movie;

  @observable
  ObservableList<ActorEntity> _cast = ObservableList();

  @computed
  MovieEntity get movie => _movie!;

  @computed
  ObservableList<ActorEntity> get cast => _cast;

  BehaviorSubject<String?> errorMessageStream = BehaviorSubject();

  @action
  Future<void> getMovie(int id) async {
    setLoading(true);
    setErrorMessage(null);

    final movieResponse = await getMovieUsecase(GetMovieParams(id));

    final castResponse = await getCastUsecase(GetCastParams(id: id));

    movieResponse.fold(
      _setErrorMessageFromFailure,
      setMovie,
    );

    castResponse.fold(
      _setErrorMessageFromFailure,
      setCast,
    );

    setLoading(false);
  }

  @action
  void setLoading(bool value) => _loading = value;

  void setErrorMessage(String? value) => errorMessageStream.add(value);

  @action
  void setMovie(MovieEntity value) => _movie = value;

  @action
  void setCast(List<ActorEntity> value) => _cast = value.asObservable();

  @action
  _setErrorMessageFromFailure(Failure failure) =>
      setErrorMessage(failure.message);
}
