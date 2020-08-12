import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class Map extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Map> {
  var points = <LatLng>[
    new LatLng(-8.8854999, -36.4803775),
    new LatLng(-8.885310, -36.497822),
  ];

  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(-8.8854999, -36.4803775),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(-8.8854999, -36.4803775),
              builder: (ctx) => new Container(
                child: Icon(Icons.add_location),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
