import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_drive/model/to_do.dart';

class ToDoEdit extends StatefulWidget {
  const ToDoEdit({super.key, required this.todo});

  final ToDo todo;

  @override
  State<ToDoEdit> createState() => _ToDoEditState();
}

class _ToDoEditState extends State<ToDoEdit> {
  ToDoState _selectedSegment = ToDoState.todo;

  void _onValueChanged(ToDoState? value) {
    if (value != null) {
      setState(() {
        _selectedSegment = value;
      });
    }
  }

  @override
  void initState() {
    _selectedSegment = widget.todo.state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Column(
        children: [
          const Text("State"),
          Center(
            child: CupertinoSlidingSegmentedControl(
              groupValue: _selectedSegment,
              children: const <ToDoState, Widget>{
                ToDoState.todo: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("To Do"),
                ),
                ToDoState.scheduled: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Scheduled"),
                ),
                ToDoState.done: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Done"),
                ),
              },
              onValueChanged: _onValueChanged,
            ),
          )
        ],
      ),
    );
  }
}
