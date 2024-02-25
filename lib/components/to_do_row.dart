import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/model/to_dos_provider.dart';
import 'package:test_drive/page/to_do_edit.dart';

import '../model/to_do.dart';

class ToDoRow extends StatefulWidget {
  const ToDoRow({super.key, required this.todo});

  final ToDo todo;

  @override
  State<ToDoRow> createState() => _ToDoRowState();
}

class _ToDoRowState extends State<ToDoRow> {
  void _onDelete() {
    Provider.of<ToDosProvider>(context, listen: false).remove(widget.todo);
  }

  void _openToDo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ToDoEdit(todo: widget.todo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _openToDo,
      title: Text(widget.todo.title),
      subtitle: Text(widget.todo.state.toString()),
      trailing: TextButton.icon(
        onPressed: _onDelete,
        icon: const Icon(Icons.delete),
        label: const Text(""),
      ),
    );
  }
}
