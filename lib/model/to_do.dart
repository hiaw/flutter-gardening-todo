import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_drive/utils/randomPosition.dart';

enum ToDoState { todo, scheduled, done }

class ToDo {
  // String title = "";
  // ToDoState state =ToDoState.todo;
  // LatLng? location;

  final id = UniqueKey();
  String title = randomString();
  ToDoState state = ToDoState.values[Random().nextInt(ToDoState.values.length)];
  LatLng location = randomLocation();
}
