import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:task_cat/features/home/data/model/fact_model.dart';

class FactEntity extends Equatable {
  @StatusConverter()
  final StatusEntity status;
  final String user;
  final String text;
  final String source;
  final String updatedAt;
  final String type;
  final String createdAt;
  final bool deleted;
  final bool used;

  const FactEntity({
    this.status = const StatusEntity(),
    this.user = "",
    this.text = "",
    this.source = "",
    this.updatedAt = "",
    this.type = "",
    this.createdAt = "",
    this.deleted = false,
    this.used = false,
  });

  @override
  List<Object> get props => [status, user, text, source, updatedAt, type, createdAt, deleted, used];
}

class StatusEntity extends Equatable {
  final bool verified;
  final int sentCount;

  const StatusEntity({
    this.verified = false,
    this.sentCount = 0,
  });

  @override
  List<Object> get props => [verified, sentCount];
}

class StatusConverter implements JsonConverter<StatusEntity, Map<String, dynamic>?> {
  const StatusConverter();
  @override
  StatusEntity fromJson(Map<String, dynamic>? json) => StatusModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(StatusEntity object) => {};
}
