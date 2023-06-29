import 'package:o_que_assistir/app/features/home/domain/entities/gender_entity.dart';

final class GenderModel extends GenderEntity {
  const GenderModel({
    required super.id,
    required super.name,
  });

  factory GenderModel.fromJson(Map<String, dynamic> jsonMap) {
    return GenderModel(
      id: jsonMap['id'].toString(),
      name: jsonMap['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'name': super.name,
    };
  }
}
