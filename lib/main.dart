import 'package:flutter/material.dart';

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
      home: const TodoListPage(title: 'Sample Todo App'),
    );
  }
}

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("タスク一覧")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("リスト追加画面(クリックで戻る)"),
      ),
    ));
  }
}
