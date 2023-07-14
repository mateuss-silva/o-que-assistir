import 'package:o_que_assistir/app/core/common/types.dart';
import 'package:o_que_assistir/app/features/home/domain/entities/gender_entity.dart';

final class GenderModel extends GenderEntity {
  const GenderModel({
    required super.id,
    required super.name,
  });

  factory GenderModel.fromJson(Json jsonMap) {
    return GenderModel(
      id: jsonMap['id'].toString(),
      name: jsonMap['name'],
    );
  }

  factory GenderModel.fromEntity(GenderEntity entity) {
    return GenderModel(
      id: entity.id,
      name: entity.name,
    );
  }

  Json toJson() {
    return {
      'id': super.id,
      'name': super.name,
    };
  }

  static List<GenderModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => GenderModel.fromJson(e)).toList();
  }
}
