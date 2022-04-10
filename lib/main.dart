import 'package:flutter/material.dart';

import 'todo_list_page.dart';

void main() {
  runApp(const SampleTodoApp());
}

class SampleTodoApp extends StatelessWidget {
  const SampleTodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListPage(),
    );
  }
}
