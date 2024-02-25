import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/components/to_do_row.dart';

import '../model/to_dos_provider.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDosProvider>(
      builder: (context, todos, child) => ListView.builder(
        itemCount: todos.length(),
        itemBuilder: (BuildContext context, int index) {
          return const ToDoRow();
        },
      ),
    );
  }
}
