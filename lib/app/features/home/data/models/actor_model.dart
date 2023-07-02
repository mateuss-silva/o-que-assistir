import 'package:o_que_assistir/app/features/home/domain/entities/actor_entity.dart';

final class ActorModel extends ActorEntity {
  const ActorModel({
    required super.id,
    required super.knownFor,
    required super.name,
    required super.profilePath,
    required super.character,
    required super.popularity,
  });

  factory ActorModel.fromJson(Map<String, dynamic> jsonMap) {
    return ActorModel(
      id: jsonMap['id'].toString(),
      knownFor: jsonMap['known_for_department'],
      name: jsonMap['name'],
      profilePath: jsonMap['profile_path'],
      character: jsonMap['character'],
      popularity: jsonMap['popularity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'known_for_department': super.knownFor,
      'name': super.name,
      'profile_path': super.profilePath,
      'character': super.character,
      'popularity': super.popularity,
    };
  }

  static List<ActorModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => ActorModel.fromJson(e)).toList();
  }
}
