import 'package:flutter/material.dart';
import 'package:test_drive/model/to_do.dart';

class ToDosProvider extends ChangeNotifier {
  final List<ToDo> _todos = [];

  int length() {
    return _todos.length;
  }

  void add(ToDo todo) {
    print("adding");
    _todos.add(todo);
    notifyListeners();
  }

  void remove(ToDo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
