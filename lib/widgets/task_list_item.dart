import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({Key? key, required this.title, required this.onDeleteConfirm}) : super(key: key);

  final String title;
  final Function onDeleteConfirm;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
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
                  title: const Text("確認"),
                  content: Text("「${title}」を削除します。"),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text("キャンセル"),
                      onPressed: () {
                        return Navigator.of(context).pop(false);
                      },
                    ),
                    ElevatedButton(
                      child: const Text(
                        "確認",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        return Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              }
            );
            if (result != null && result) {
              // タスクリストの更新
              onDeleteConfirm();
            }
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}