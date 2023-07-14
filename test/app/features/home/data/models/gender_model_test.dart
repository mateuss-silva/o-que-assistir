import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:o_que_assistir/app/core/common/types.dart';
import 'package:o_que_assistir/app/features/home/data/models/gender_model.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/gender_entity.dart';

import '../../../../fixtures/fixture_render.dart';

void main() {
  const genderModel = GenderModel(id: "18", name: 'Drama');

  // test

  test("should be a subclass of Gender Entity", () async {
    // arrange

    // act

    // assert
    expect(genderModel, isA<GenderEntity>());
  });

  test("should return a valid model for the JSON gender", () {
    // arrange
    final Json jsonMap = json.decode(fixture("gender.json"));

    // act
    final result = GenderModel.fromJson(jsonMap);

    // assert
    expect(result, genderModel);
  });

  test("should return a JSON map containing the proper data", () {
    // arrange

    // act
    final result = genderModel.toJson();

    // assert
    final expectedMap = {
      "id": "18",
      "name": "Drama",
    };
    expect(result, expectedMap);
  });

  test("should return a valid list of model for the JSON list gender", () {
    // arrange
    final List jsonList = json.decode(fixture("movie.json"))['genres'];

    // act
    final result = GenderModel.fromJsonList(jsonList);

    // assert
    expect(result, isA<List<GenderModel>>());
  });
}
