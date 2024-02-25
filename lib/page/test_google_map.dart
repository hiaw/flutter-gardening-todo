import 'package:flutter/material.dart';
import 'package:test_drive/components/map_component.dart';

class TestGoogleMap extends StatelessWidget {
  const TestGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: const MapComponent(),
    );
  }
}
