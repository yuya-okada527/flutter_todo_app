import 'package:flutter/material.dart';
import 'package:sample_app/models/task_model.dart';
import 'package:sample_app/repositories/task_repository.dart';

import 'todo_add_page.dart';
import 'widgets/task_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<TaskModel> _todoList = [];

  @override
  void initState() {
    super.initState();
    Future(() async {
      var taskRepository = TaskRepository();
      var list = await taskRepository.fetchTasks();
      setState(() {
        _todoList.add(list.removeLast());
        _todoList.add(list.removeLast());
      });
    });
  }

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
                  title: _todoList[index].title,
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
          final newTask = await Navigator.of(context).push<TaskModel>(
            MaterialPageRoute(builder: (context) {
              return const TodoAddPage();
            }),
          );
          if (newTask != null) {
            setState(() {
              _todoList.add(newTask);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
