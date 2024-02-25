import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/model/to_do.dart';
import 'package:test_drive/model/to_dos_provider.dart';

class ToDoEdit extends StatefulWidget {
  const ToDoEdit({super.key, required this.todo});

  final ToDo todo;

  @override
  State<ToDoEdit> createState() => _ToDoEditState();
}

class _ToDoEditState extends State<ToDoEdit> {
  ToDoState _selectedSegment = ToDoState.todo;
  String _title = "";

  @override
  void initState() {
    _selectedSegment = widget.todo.state;
    _title = widget.todo.title;
    super.initState();
  }

  void _onValueChanged(ToDoState? value) {
    if (value != null) {
      setState(() {
        _selectedSegment = value;
      });
    }
  }

  void _onTitleChange(String? value) {
    if (value != null) {
      setState(() {
        _title = value;
      });
    }
  }

  void _onSave() {
    widget.todo.title = _title;
    widget.todo.state = _selectedSegment;
    Provider.of<ToDosProvider>(context, listen: false).updateTodo(widget.todo);
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
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: _title,
              onChanged: _onTitleChange,
              decoration: const InputDecoration(
                labelText: "To Do Title",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _onSave,
            child: const Text("Save"),
          )
        ],
      ),
    );
  }
}
