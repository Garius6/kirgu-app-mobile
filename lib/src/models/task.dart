import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

enum Status {
  @JsonValue('in_queue')
  inQueue,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('done')
  done,
  @JsonValue('rejected')
  rejected
}

@JsonSerializable()
class Task {
  Task(
      {required this.id,
      required this.title,
      this.responsible = "",
      this.status = Status.inQueue});

  @JsonKey(required: true)
  final int id;
  @JsonKey(required: true)
  final String title;
  String responsible;
  Status status;

  @override
  String toString() {
    return "($id: $title $responsible $status)";
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
