import 'package:flutter/material.dart';
import 'package:kirgu_app/src/models/task.dart';
import 'package:kirgu_app/src/screens/task_detail.dart';
import 'package:http/http.dart' as http;

import 'package:kirgu_app/src/services/task_service.dart';

class TasksList extends StatefulWidget {
  TasksList({super.key});

  final List<Task> tasks = [
    Task(id: 1, title: "Some title"),
    Task(id: 2, title: "Some title 2")
  ];

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  void _openDetails(Task e) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TaskDetail(task: e)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task list"),
      ),
      body: FutureBuilder<List<Task>>(
          future: fetchTasks(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong"));
            } else if (snapshot.hasData) {
              return Center(
                  child: ListView(
                      children: snapshot.data!
                          .map((e) => ListTile(
                                title: Text(e.toString()),
                                onTap: () {
                                  _openDetails(e);
                                },
                              ))
                          .toList()));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskDetail(
                        task: Task(id: 1, title: "some title"),
                      )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
