import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/model/to_dos_provider.dart';

import '../model/to_do.dart';

class ToDoRow extends StatefulWidget {
  const ToDoRow({super.key, required this.todo});

  final ToDo todo;

  @override
  State<ToDoRow> createState() => _ToDoRowState();
}

class _ToDoRowState extends State<ToDoRow> {
  void onPressed() {
    Provider.of<ToDosProvider>(context, listen: false).remove(widget.todo);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.todo.title),
      subtitle: Text(widget.todo.state.toString()),
      trailing: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.delete),
        label: const Text(""),
      ),
    );
  }
}
