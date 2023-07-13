// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:o_que_assistir/app/core/error/failure.dart';
import 'package:o_que_assistir/app/core/error/failure_extension.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/tv_serie_entity.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_cast_usecase.dart';
import 'package:o_que_assistir/app/features/home/domain/usecases/get_tv_serie_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'tv_serie_details_store.g.dart';

class TVSerieDetailsStore = TVSerieDetailsStoreBase with _$TVSerieDetailsStore;

abstract class TVSerieDetailsStoreBase with Store {
  final GetTVSerieUsecase getTVSerieUsecase;
  final GetCastUsecase getCastUsecase;

  TVSerieDetailsStoreBase(this.getTVSerieUsecase, this.getCastUsecase);

  @observable
  bool _loading = false;

  @computed
  bool get loading => _loading;

  @observable
  TVSerieEntity? _tvSerie;

  @observable
  ObservableList<ActorEntity> _cast = ObservableList();

  @computed
  TVSerieEntity get tvSerie => _tvSerie!;

  @computed
  ObservableList<ActorEntity> get cast => _cast;

  BehaviorSubject<String?> errorMessageStream = BehaviorSubject();

  @action
  Future<void> getTVSerie(int id) async {
    setLoading(true);
    setErrorMessage(null);

    final tvSerieResponse = await getTVSerieUsecase(GetTVSerieParams(id));

    final castResponse = await getCastUsecase(GetCastParams(id: id));

    tvSerieResponse.fold(
      _setErrorMessageFromFailure,
      setTVSerie,
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
  void setTVSerie(TVSerieEntity value) => _tvSerie = value;

  @action
  void setCast(List<ActorEntity> value) => _cast = value.asObservable();

  @action
  _setErrorMessageFromFailure(Failure failure) =>
      setErrorMessage(failure.message);
}
