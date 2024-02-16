import 'package:json_annotation/json_annotation.dart';
import 'package:task_cat/features/home/domain/entity/fact_entity.dart';

part 'fact_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FactModel extends FactEntity {
  const FactModel({
    super.createdAt,
    super.deleted,
    super.source,
    super.status,
    super.text,
    super.type,
    super.updatedAt,
    super.used,
    super.user,
  });

  factory FactModel.fromJson(Map<String, dynamic> json) => _$FactModelFromJson(json);

  Map<String, dynamic> toJson() => _$FactModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StatusModel extends StatusEntity {
  const StatusModel({super.sentCount, super.verified});

  factory StatusModel.fromJson(Map<String, dynamic> json) => _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}
