import 'package:arretadas/mixins/messages_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class Map2Page extends StatelessWidget {
  const Map2Page({Key key}) : super(key: key);
  static const router = '/map2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione o local'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Map2Content(),
      ),
    );
  }
}

class Map2Content extends StatefulWidget {
  const Map2Content({Key key}) : super(key: key);
  @override
  _MapContentState createState() => _MapContentState();
}

class _MapContentState extends State<Map2Content> with MessagesMixin {
  int pointIndex;
  List points = [
    LatLng(-8.8854999, -36.4803775),
    LatLng(-8.885310, -36.497822),
    LatLng(-8.88439326, -36.50439262),
    LatLng(-8.90003869, -36.49958611),
  ];

  @override
  void initState() {
    super.initState();
    pointIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: MapOptions(
            center: points[0],
            zoom: 13,
            onLongPress: (point) => _setUserChoice(point),
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
          ]),
    );
  }

  void _setUserChoice(point) {
    Navigator.pop(context, point);
  }
}
