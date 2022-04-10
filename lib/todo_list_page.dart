import 'package:flutter/material.dart';

import 'todo_add_page.dart';

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
                return Card(
                  child: ListTile(
                    title: Text(
                      _todoList[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        // アラートの表示
                        var result = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('確認'),
                                content: Text("「${_todoList[index]}」を削除します。"),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text("キャンセル"),
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                  ),
                                  ElevatedButton(
                                    child: const Text(
                                      "確認",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                  ),
                                ],
                              );
                            });
                        if (result != null && result) {
                          // タスクリストの更新
                          setState(() {
                            _todoList.removeAt(index);
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
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

  // MEMO: ↓はうまく動かない。。
  // @override
  // void initState() {
  //   super.initState();
  //   _todoList.add("init task");
  // }
}
