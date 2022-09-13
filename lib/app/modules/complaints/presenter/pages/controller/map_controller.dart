import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapaController extends ChangeNotifier {
  final List<Marker> markers = [];

  void addMark(Marker marker) {
    markers.add(marker);
    notifyListeners();
  }
}
