import 'package:google_maps_flutter/google_maps_flutter.dart';

enum ToDoState { todo, scheduled, done }

class ToDo {
  String title = "";
  ToDoState state = ToDoState.todo;
  LatLng? location;
}
