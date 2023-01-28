enum Status { inQueue, inProgress, done, rejected }

class Task {
  Task(
      {required this.id,
      required this.title,
      this.responsible = "",
      this.status = Status.inQueue});

  final int id;
  final String title;
  String responsible;
  Status status;
}
