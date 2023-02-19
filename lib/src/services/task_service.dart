import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:kirgu_app/src/models/task.dart';
import 'package:http/http.dart' as http;

const String serverURL = 'http://192.168.1.110:8000';

Future<List<Task>> fetchTasks(http.Client client) async {
  final response = await client.get(Uri.parse('$serverURL/tasks/'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(_parseTasks, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Task> _parseTasks(String responseBody) {
  final parsed = jsonDecode(responseBody);
  print(parsed);
  return parsed.map<Task>((json) => Task.fromJson(json)).toList();
}

Future<http.Response> createTask(Task task) {
  return http.post(
    Uri.parse('$serverURL/tasks/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(task),
  );
}
