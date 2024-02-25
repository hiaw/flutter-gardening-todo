import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_drive/utils/randomPosition.dart';

enum ToDoState { todo, scheduled, done }

class ToDo {
  // String title = "";
  // ToDoState state =ToDoState.todo;
  // LatLng? location;
  //
  String title = Random().nextInt(10000).toString();
  ToDoState state = ToDoState.values[Random().nextInt(ToDoState.values.length)];
  LatLng? location = randomLocation();
}
