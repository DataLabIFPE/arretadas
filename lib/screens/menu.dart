import 'package:arretadas/components/Header.dart';
import 'package:arretadas/components/Button.dart';
import 'package:arretadas/exceptions/rest_exception.dart';
import 'package:arretadas/helpers/custom_dio.dart';
import 'package:arretadas/mixins/messages_mixin.dart';
import 'package:arretadas/modules/map/view/map_page.dart';
import 'package:arretadas/modules/splash/view/splash_page.dart';
import 'package:arretadas/modules/usefulcontacts/view/usefulcontacts_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  Menu({Key key, this.name});
  final String name;

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with MessagesMixin {
  Future<Position> _getLocation() async {
    final location = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return location;
  }

  Future<dynamic> _sendMessage(Position data) async {
    var dio = CustomDio().instance;
    try {
      await dio.post('https://arretadas-api.herokuapp.com/alert',
          data: {'latitude': data.latitude, 'longitude': data.longitude});
    } on DioError catch (e) {
      print('Erro na requisição');
      print(e);
      throw RestException('Erro ao enviar alerta');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Header(
                            title: 'Arretadas',
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Image.asset('assets/icon-person.png')),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Button(
                        width: (MediaQuery.of(context).size.width * 0.95),
                        margin: EdgeInsets.only(top: 20.0),
                        height: 70.0,
                        txtColor: Colors.white,
                        btnColor: Colors.redAccent,
                        fontSize: 20.0,
                        child: Text(
                          'PEDIR SOCORRO',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        callback: () async {
                          _showAlertDialog2(context);
                        },
                      ),
                    ),
                    //Botão denunciar
                    Button(
                      width: (MediaQuery.of(context).size.width * 0.95),
                      height: 70.0,
                      margin: EdgeInsets.only(top: 20.0),
                      txtColor: Colors.white,
                      btnColor: Colors.red[600],
                      fontSize: 18.0,
                      child: Text(
                        'DENUNCIAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      callback: () {
                        Navigator.pushNamed(context, MapPage.router);
                      },
                    ),

                    /*Container(
                      margin: EdgeInsets.all(10),
                      height: 200.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(255, 209, 209, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ListTile(
                            title: Container(
                              margin: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                'Novidades',
                                style: TextStyle(
                                  color: Colors.red[500],
                                  fontSize: 20,
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            subtitle: Container(
                              child: Text(
                                'Teste',
                                style: TextStyle(
                                  color: Colors.red[400],
                                  fontFamily: 'Exo',
                                ),
                              ),
                            ),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'SAIBA MAIS >',
                                  style: TextStyle(
                                    color: Colors.red[200],
                                    fontSize: 22.0,
                                    fontFamily: 'Exo',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),*/

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Button(
                          child: Icon(
                            Icons.import_contacts,
                            size: 50,
                            color: Colors.white,
                          ),
                          btnColor: Colors.red[300],
                          width: 80.0,
                          height: 80.0,
                          callback: () {
                            Navigator.pushNamed(context, '/info');
                          },
                        ),
                        Button(
                          child: Icon(
                            Icons.local_phone,
                            size: 50,
                            color: Colors.white,
                          ),
                          btnColor: Colors.red[300],
                          width: 80.0,
                          height: 80.0,
                          callback: () {
                            Navigator.pushNamed(
                                context, UsefulcontactsPage.router);
                          },
                        ),
                        Button(
                          child: Icon(
                            Icons.group,
                            size: 50,
                            color: Colors.white,
                          ),
                          btnColor: Colors.red[300],
                          width: 80.0,
                          height: 80.0,
                          callback: () {
                            Navigator.pushNamed(context, '/contacts');
                          },
                        ),
                        Button(
                          child: Icon(
                            Icons.location_on_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                          btnColor: Colors.red[300],
                          width: 80.0,
                          height: 80.0,
                          callback: () {
                            Navigator.pushNamed(context, MapPage.router);
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: () {
                              SharedPreferences.getInstance().then((sp) {
                                sp.clear();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    SplashPage.router, (route) => false);
                              });
                            },
                            child: Text('Sair'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showAlertDialog2(BuildContext context) {
    Widget cancelaButton = TextButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continuaButton = TextButton(
      child: Text("Enviar"),
      onPressed: () async {
        Navigator.pop(context);
        var coordinators = await _getLocation();
        //await _sendMessage(coordinators);
        await _sendMessage(coordinators);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Atenção"),
      content: Text("Deseja enviar o pedido de socorro?"),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
