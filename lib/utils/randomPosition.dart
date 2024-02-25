import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

final _random = Random();
const _lat = 45.521563;
const _lng = -122.677433;
const _range = 2;
const LatLng mapCenter = LatLng(_lat, _lng);

LatLng randomLocation() {
  return LatLng(
    _lat + _random.nextDouble() * _range - _range / 2,
    _lng + _random.nextDouble() * _range - _range / 2,
  );
}
