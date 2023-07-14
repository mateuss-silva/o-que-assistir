import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:o_que_assistir/app/core/common/types.dart';
import 'package:o_que_assistir/app/features/home/data/models/actor_model.dart';

import '../../../../fixtures/fixture_render.dart';

void main() {
  const tActorModel = ActorModel(
    id: "819",
    name: "Edward Norton",
    character: "The Narrator",
    profilePath: "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg",
    knownFor: "Acting",
    popularity: 37.77,
  );

  test('should be a subclass of ActorEntity', () async {
    // assert
    expect(tActorModel, isA<ActorModel>());
  });

  test('should return a valid actor model for the JSON credits', () async {
    // arrange
    final Json jsonMap =
        json.decode(fixture('credits.json'))['cast'][0];

    // act
    final result = ActorModel.fromJson(jsonMap);

    // assert
    expect(result, tActorModel);
  });

  test('should return a JSON map containing the proper data', () async {
    // arrange

    // act
    final result = tActorModel.toJson();

    // assert
    final expectedMap = {
      'id': '819',
      'known_for_department': 'Acting',
      'name': 'Edward Norton',
      'profile_path': '/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg',
      'character': 'The Narrator',
      'popularity': 37.77,
    };
    expect(result, expectedMap);
  });

  test('should return a valid list of model for the JSON credits', () async {
    // arrange
    final List jsonList = json.decode(fixture('credits.json'))['cast'];

    // act
    final result = ActorModel.fromJsonList(jsonList);

    // assert
    expect(result, isA<List<ActorModel>>());
  });
}
