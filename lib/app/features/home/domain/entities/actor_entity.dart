import 'package:o_que_assistir/app/core/entities/entity.dart';

base class ActorEntity extends Entity {
  final String name;
  final String knownFor;
  final String? profilePath;
  final String character;
  final double popularity;

  const ActorEntity({
    required super.id,
    required this.knownFor,
    required this.name,
    required this.profilePath,
    required this.character,
    required this.popularity,
  });
}
