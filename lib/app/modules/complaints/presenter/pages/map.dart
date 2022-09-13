import 'package:arretadas/app/modules/complaints/presenter/pages/controller/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'controller/controller_city.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Mapa> {
  LatLng point = LatLng(-8.8854999, -36.4803775);
  bool isMonteiro = false;
  final controller = MapaController();
  String city = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      city = await ControllerCity().getCity();
    });
    setState(() {
      if (city == 'Monteiro') {
        point = LatLng(-7.892373849262881, -37.122802734375);
        isMonteiro = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione o local'),
        centerTitle: true,
      ),
      body: FlutterMap(
        options: MapOptions(
            center: point,
            zoom: isMonteiro ? 15.0 : 13.0,
            onLongPress: (_, point) {
              _setUserChoice(point);
            }),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            attributionBuilder: (_) {
              return const Text("© OpenStreetMap contributors");
            },
          ),
        ],
      ),
    );
  }

  void _setUserChoice(LatLng point) {
    Marker _marker = Marker(
      anchorPos: AnchorPos.align(AnchorAlign.center),
      height: 30,
      width: 30,
      point: point,
      builder: (ctx) => const Icon(Icons.pin_drop),
    );
    controller.addMark(_marker);
    Navigator.pop(context, point);
  }
}
