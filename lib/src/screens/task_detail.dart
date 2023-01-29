import 'package:flutter/material.dart';

import 'package:kirgu_app/src/models/task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Column(
        children: [
          Text(task.title),
          Text(task.id.toString()),
          Text(task.status.toString())
        ],
      ),
    );
  }
}
