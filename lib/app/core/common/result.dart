import 'dart:convert';

import 'package:http/http.dart';

sealed class Result {
  final dynamic data;

  Result(this.data);

  static dynamic decode(Response response) {
    return json.decode(response.body);
  }
}

final class SingleResult extends Result {
  SingleResult._(super.data);

  factory SingleResult.fromResponse(Response response) {
    return SingleResult._(Result.decode(response));
  }
}

final class MultipleResult extends Result {
  MultipleResult._(super.data);

  factory MultipleResult.fromResponse(Response response) {
    return MultipleResult._(Result.decode(response)['results'] as List);
  }
}

final class CastResult extends Result {
  CastResult._(super.data);

  factory CastResult.fromResponse(Response response) {
    return CastResult._(Result.decode(response)['cast'] as List);
  }
}
