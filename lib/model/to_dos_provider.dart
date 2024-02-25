import 'package:flutter/material.dart';
import 'package:test_drive/model/to_do.dart';

class ToDosProvider extends ChangeNotifier {
  final List<ToDo> _todos = [];

  List<ToDo> get todos => _todos;

  void add(ToDo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void remove(ToDo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void removeAll() {
    _todos.removeRange(0, _todos.length);
    notifyListeners();
  }

  List<ToDo> get scheduled {
    return todos.where((todo) => todo.state == ToDoState.scheduled).toList();
  }
}
