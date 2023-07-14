import 'package:o_que_assistir/app/core/common/extensions/string_extension.dart';
import 'package:o_que_assistir/app/core/entities/entity.dart';

base class GenderEntity extends Entity {
  final String? name;

  const GenderEntity({
    required super.id,
    required this.name,
  });

  static bool hasGender(List<GenderEntity> genres) {
    return genres.isNotEmpty && genres.first.name.isNotNullOrEmpty;
  }

  static String gender(List<GenderEntity> genres) {
    return genres.first.name!;
  }

  @override
  List<Object?> get props => [id, name];
}
