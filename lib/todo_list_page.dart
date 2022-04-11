import 'package:flutter/material.dart';

import 'todo_add_page.dart';
import 'widgets/task_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<String> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("リスト一覧"),
      ),
      body: _todoList.isNotEmpty
          ? ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return TaskListItem(
                  title: _todoList[index],
                  onDeleteConfirm: () {
                    setState(() {
                      _todoList.removeAt(index);
                    });
                  },
                );
              },
            )
          : const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "タスクがありません。",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return const TodoAddPage();
            }),
          );
          if (newListText != null) {
            setState(() {
              _todoList.add(newListText);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
