import 'package:flutter/material.dart';
import 'mapa.dart';

class Denuncias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fazer Denúncias",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(248, 92, 104, 1),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fazer Denúncias"),
        ),
        body: MapaDenunciar(),
      ),
    );
  }
}

class MapaDenunciar extends StatefulWidget {
  @override
  _MapaDenunciarState createState() => _MapaDenunciarState();
}

class _MapaDenunciarState extends State<MapaDenunciar> {
  @override
  Widget build(BuildContext context) {
    AppBar(
      title: Text("Fazer denun"),
    );
    return Container(
      child: Map(),
    );
  }
}
