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
      appBar: AppBar(
        title: const Text("リスト一覧"),
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text("ニンジンを買う"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("タマネギを買う"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("ジャガイモを買う"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("カレールーを買う"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const TodoAddPage();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoAddPage extends StatelessWidget {
  const TodoAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("リスト追加")
      ),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("リスト追加", style: TextStyle(color: Colors.white))
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("キャンセル"),
              )
            ),
          ],
        ),
      ),
    );
  }
}
