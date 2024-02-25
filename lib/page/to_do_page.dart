import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/to_do_list.dart';
import '../model/to_do.dart';
import '../model/to_dos_provider.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  void addTodo() {
    // ignore: avoid_print
    print("adding todo");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<ToDosProvider>(
          builder: (context, todos, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  todos.add(ToDo());
                },
                child: const Text("New To Do"),
              ),
              ElevatedButton(
                onPressed: () {
                  todos.removeAll();
                },
                child: const Text("Remove All"),
              ),
            ],
          ),
        ),
        const Expanded(
          child: SizedBox(
            height: 200,
            child: ToDoList(),
          ),
        ),
      ],
    );
  }
}
