import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/model/to_dos_provider.dart';
import 'package:tsp_route_finder/tsp_route_finder.dart';

import '../model/to_do.dart';
import '../utils/randomPosition.dart';

class MapComponent extends StatefulWidget {
  const MapComponent({super.key});

  @override
  State<MapComponent> createState() => _MapComponent();
}

class _MapComponent extends State<MapComponent> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    findTSP();
  }

  void findTSP() async {
    List<ToDo> scheduled =
        Provider.of<ToDosProvider>(context, listen: false).scheduled;

    markers = scheduled
        .map(
          (todo) => Marker(
              markerId: MarkerId(todo.id.toString()), position: todo.location),
        )
        .toSet();

    final locations = scheduled
        .map(
          (todo) => CitiesLocations(
              cityName: todo.title,
              latitude: todo.location.latitude,
              longitude: todo.location.longitude),
        )
        .toList();
    tspRoute = await TspPackage.calculateTspRoute(
      locations: locations,
      startingLocationIndex: 0,
    );

    List<LatLng> route =
        tspRoute.toList().map((i) => scheduled[i].location).toList();
    polylines = {
      Polyline(points: route, polylineId: const PolylineId("route"))
    };

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDosProvider>(
      builder: (context, todos, child) {
        return GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: mapCenter,
            zoom: 11.0,
          ),
          markers: markers,
          polylines: polylines,
        );
      },
    );
  }
}
