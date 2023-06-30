import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/error/failure_extension.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/movie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_movie_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetMovieUsecase getMovieUsecase;

  HomeStoreBase(this.getMovieUsecase);

  @observable
  bool _loading = false;

  @computed
  bool get loading => _loading;

  @observable
  MovieEntity? _movie;

  @computed
  MovieEntity get movie => _movie!;

  // ignore: prefer_final_fields
  BehaviorSubject<String?> errorMessageStream = BehaviorSubject();

  @action
  Future<void> getMovie(int id) async {
    setLoading(true);
    setErrorMessage(null);

    final movieResponse = await getMovieUsecase(GetMovieParams(id));

    movieResponse.fold(
      _setErrorMessageFromFailure,
      setMovie,
    );

    setLoading(false);
  }

  @action
  void setLoading(bool value) => _loading = value;

  void setErrorMessage(String? value) => errorMessageStream.add(value);

  @action
  void setMovie(MovieEntity value) => _movie = value;

  @action
  _setErrorMessageFromFailure(Failure failure) =>
      setErrorMessage(failure.message);
}
