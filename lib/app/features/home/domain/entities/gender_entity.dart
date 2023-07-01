import 'package:o_que_assistir/app/core/entities/entity.dart';

base class GenderEntity extends Entity {
  final String? name;

  const GenderEntity({
    required super.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
