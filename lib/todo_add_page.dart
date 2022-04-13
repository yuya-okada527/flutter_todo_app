import 'package:flutter/material.dart';
import 'package:sample_app/models/task_model.dart';
import 'package:sample_app/repositories/task_repository.dart';

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({Key? key}) : super(key: key);

  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("リスト追加")),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(TaskModel(1, _text, false));
                  },
                  child: const Text("リスト追加",
                      style: TextStyle(color: Colors.white))),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("キャンセル"),
              ),
            ),
            ElevatedButton(
              child: const Text("fetch"),
              onPressed: () async {
                var repository = TaskRepository();
                var response = await repository.fetchTasks();
                print(response[0].title);
              },
            ),
          ],
        ),
      ),
    );
  }
}
