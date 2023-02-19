import 'package:flutter/material.dart';
import 'package:kirgu_app/src/models/task.dart';
import 'package:kirgu_app/src/screens/task_create.dart';
import 'package:kirgu_app/src/screens/task_detail.dart';
import 'package:http/http.dart' as http;

import 'package:kirgu_app/src/services/task_service.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  late Future<List<Task>> fetchTask;

  void _openDetails(Task e) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TaskDetail(task: e)));
  }

  @override
  void initState() {
    super.initState();
    fetchTask = fetchTasks(http.Client());
  }

  void _updateList() {
    setState(() {
      fetchTask = fetchTasks(http.Client());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task list"),
        actions: [
          IconButton(onPressed: _updateList, icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder<List<Task>>(
          future: fetchTask,
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TaskCreateForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
