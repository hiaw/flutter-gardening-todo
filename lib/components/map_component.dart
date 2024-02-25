import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/randomPosition.dart';

class MapComponent extends StatefulWidget {
  const MapComponent({super.key});

  @override
  State<MapComponent> createState() => _MapComponent();
}

class _MapComponent extends State<MapComponent> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: mapCenter,
        zoom: 11.0,
      ),
      markers: {
        Marker(markerId: MarkerId(randomString()), position: randomLocation()),
        Marker(markerId: MarkerId(randomString()), position: randomLocation()),
        Marker(markerId: MarkerId(randomString()), position: randomLocation()),
        Marker(markerId: MarkerId(randomString()), position: randomLocation()),
        Marker(markerId: MarkerId(randomString()), position: randomLocation()),
        Marker(markerId: MarkerId(randomString()), position: randomLocation()),
      },
    );
  }
}
