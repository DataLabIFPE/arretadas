import 'package:arretadas/mixins/messages_mixin.dart';
import 'package:arretadas/modules/complaints/controller/complaints_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key key}) : super(key: key);
  static const router = '/map';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => ComplaintsController()..findComplaints(),
          child: MapContent(),
        ),
      ),
    );
  }
}

class MapContent extends StatefulWidget {
  const MapContent({Key key}) : super(key: key);
  @override
  _MapContentState createState() => _MapContentState();
}

class _MapContentState extends State<MapContent> with MessagesMixin {
  final PopupController _popupController = PopupController();
  int pointIndex;
  List<Marker> markers;
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
    markers = [];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ComplaintsController>(builder: (_, controller, __) {
      if (controller.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (!isNull(controller.error)) {
        return Center(child: Text(controller.error));
      }

      var complaints = controller.complaints;
      if (controller.sendSucess) {
        for (var i = 0; i < complaints.length; i++) {
          _setMarkers(complaints[i].latitude, complaints[i].longitude);
        }
      }

      return Scaffold(
        body: FlutterMap(
            options: MapOptions(
              center: points[0],
              zoom: 13,
              plugins: [
                MarkerClusterPlugin(),
              ],
              onTap: (_) => _popupController.hidePopup(),
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerClusterLayerOptions(
                maxClusterRadius: 120,
                disableClusteringAtZoom: 12,
                size: Size(40, 40),
                anchor: AnchorPos.align(AnchorAlign.center),
                fitBoundsOptions: FitBoundsOptions(
                  padding: EdgeInsets.all(50),
                ),
                markers: markers,
                polygonOptions: PolygonOptions(
                    borderColor: Colors.blueAccent,
                    color: Colors.black12,
                    borderStrokeWidth: 3),
                popupOptions: PopupOptions(
                    popupSnap: PopupSnap.top,
                    popupController: _popupController,
                    popupBuilder: (_, marker) => Container(
                          width: 200,
                          height: 100,
                          color: Colors.white,
                          child: GestureDetector(
                            onTap: () => debugPrint("Popup tap!"),
                            child: Text(
                              "Informação da localização ${marker.point}",
                            ),
                          ),
                        )),
                builder: (context, markers) {
                  return FloatingActionButton(
                    child: Text(markers.length.toString()),
                    onPressed: null,
                  );
                },
              ),
            ]),
      );
    });
  }

  void _setMarkers(String latitude, String longitude) {
    Marker marker = Marker(
      anchorPos: AnchorPos.align(AnchorAlign.center),
      height: 30,
      width: 30,
      point: LatLng(double.parse(latitude), double.parse(longitude)),
      builder: (ctx) => Icon(Icons.pin_drop),
    );
    markers.add(marker);
  }
}
