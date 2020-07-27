import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';


 
class Mapa1 extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
 
class _MyHomePageState extends State<Mapa1> {
  var points = <LatLng>[
        new LatLng(35.22, -101.83),
        new LatLng(32.77, -96.79),
        new LatLng(29.76, -95.36),
        new LatLng(29.42, -98.49),
        new LatLng(35.22, -101.83),
  ];

@override
Widget build (BuildContext context) {
  return new FlutterMap(
    options: new MapOptions(
      center: new LatLng(51.5, -0.09),
      zoom: 13.0,
    ),
    layers: [
      new TileLayerOptions(
        urlTemplate: "https://api.mapbox.com/styles/v1/lyrasolfieri/ckd4yn52703x61hpbxweowuwp/wmts?access_token=pk.eyJ1IjoibHlyYXNvbGZpZXJpIiwiYSI6ImNrZDRqdWs0bTEwN3AycXA1MG5vYWNldW0ifQ.jAGfwtQBhnasms0EScPAgw",
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoibHlyYXNvbGZpZXJpIiwiYSI6ImNrZDRqdWs0bTEwN3AycXA1MG5vYWNldW0ifQ.jAGfwtQBhnasms0EScPAgw',
          'id': 'mapbox.mapbox-streets-v7'
        }
      ),



      new MarkerLayerOptions(
        markers: [
          new Marker(
            width: 45.0,
            height: 45.0,
            point: new LatLng(35.215, -101.825),
            builder: (context) =>
            new Container(
              child: new IconButton(
               icon: Icon(Icons.location_on),
               color: Color.fromRGBO(248,92,104,1),
               onPressed: (){
                 print("Clicou");
               },
            ),
          ),
          )],
      ),

      
      new PolylineLayerOptions(
        polylines: [
                  new Polyline(
                    points: points,
                    strokeWidth: 5.0,
                    color: Colors.red
                  )
                ]
      ),
    ],
  );
}
}