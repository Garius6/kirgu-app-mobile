import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/task.dart';

import 'package:http/http.dart' as http;

Future<List<Task>> fetchTasks(http.Client client) async {
  final response =
      await client.get(Uri.parse('http://192.168.1.110:8000/tasks/'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseTasks, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Task> parseTasks(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return parsed.map<Task>((json) => Task.fromJson(json)).toList();
}
