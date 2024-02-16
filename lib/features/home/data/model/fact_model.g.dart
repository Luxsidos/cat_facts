// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactModel _$FactModelFromJson(Map<String, dynamic> json) => FactModel(
      createdAt: json['created_at'] as String? ?? "",
      deleted: json['deleted'] as bool? ?? false,
      source: json['source'] as String? ?? "",
      status: json['status'] == null
          ? const StatusEntity()
          : const StatusConverter()
              .fromJson(json['status'] as Map<String, dynamic>?),
      text: json['text'] as String? ?? "",
      type: json['type'] as String? ?? "",
      updatedAt: json['updated_at'] as String? ?? "",
      used: json['used'] as bool? ?? false,
      user: json['user'] as String? ?? "",
    );

Map<String, dynamic> _$FactModelToJson(FactModel instance) => <String, dynamic>{
      'status': const StatusConverter().toJson(instance.status),
      'user': instance.user,
      'text': instance.text,
      'source': instance.source,
      'updated_at': instance.updatedAt,
      'type': instance.type,
      'created_at': instance.createdAt,
      'deleted': instance.deleted,
      'used': instance.used,
    };

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel(
      sentCount: json['sent_count'] as int? ?? 0,
      verified: json['verified'] as bool? ?? false,
    );

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'sent_count': instance.sentCount,
    };
