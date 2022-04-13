import 'dart:convert';

import 'package:sample_app/models/task_model.dart';
import 'package:http/http.dart' as http;

class TaskRepository {

  Future<List<TaskModel>> fetchTasks() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    var response = await http.get(url);
    List<TaskModel> list = jsonDecode(response.body).toList().map<TaskModel>((val) => TaskModel.fromJson(val)).toList();
    return list;
  }
}