import 'package:flutter/material.dart';

import '../model/to_do.dart';

class ToDoRow extends StatelessWidget {
  const ToDoRow({super.key, required this.todo});

  final ToDo todo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(todo.title),
        Text(todo.state.toString()),
      ],
    );
  }
}
