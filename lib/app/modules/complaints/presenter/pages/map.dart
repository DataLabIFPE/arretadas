import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Mapa> {
  LatLng point = LatLng(-8.8854999, -36.4803775);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione o local'),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
            center: point,
            zoom: 13.0,
            onLongPress: (_, point) => _setUserChoice(point)),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            attributionBuilder: (_) {
              return Text("© OpenStreetMap contributors");
            },
          ),
        ],
      ),
    );
  }

  void _setUserChoice(point) {
    Navigator.pop(context, point);
  }
}
