import 'package:flutter/material.dart';
import 'package:test_drive/model/to_do.dart';

class ToDoEdit extends StatefulWidget {
  const ToDoEdit({super.key, required this.todo});

  final ToDo todo;

  @override
  State<ToDoEdit> createState() => _ToDoEditState();
}

class _ToDoEditState extends State<ToDoEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: const Text("To Do Edit"),
    );
  }
}
