// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'title'],
  );
  return Task(
    id: json['id'] as int,
    title: json['title'] as String,
    responsible: json['responsible'] as String? ?? "",
    status:
        $enumDecodeNullable(_$StatusEnumMap, json['status']) ?? Status.inQueue,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'responsible': instance.responsible,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.inQueue: 'in_queue',
  Status.inProgress: 'in_progress',
  Status.done: 'done',
  Status.rejected: 'rejected',
};
