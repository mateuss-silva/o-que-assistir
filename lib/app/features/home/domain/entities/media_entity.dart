import 'package:o_que_assistir/app/core/entities/entity.dart';

enum MediaType {
  movie,
  tv,
  person;

  bool get isPerson => this == person;

  static MediaType fromString(String type) {
    switch (type) {
      case "movie":
        return movie;
      case "tv":
        return tv;
      case "person":
        return person;
      default:
        throw Exception('Invalid media type');
    }
  }
}

abstract base class MediaEntity extends Entity {
  final MediaType type;
  const MediaEntity({
    required super.id,
    required this.type,
  });
}
