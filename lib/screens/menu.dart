
import 'package:arretadas/components/Header.dart';

import 'package:arretadas/components/Button.dart';

import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

class Menu extends StatefulWidget {
  Menu({Key key, this.name});
  final String name;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // void _getLocation() async {
  //   final location = await Geolocator()
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   print(location);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "assets/Background.jpg",
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Header(
                          userName: 'Raffael',

                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset('assets/icon-person.png')),
                      ],
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: 90.0,
                    //   margin: EdgeInsets.only(left: 6, right: 6, top: 15),
                    //   decoration: BoxDecoration(
                    //     color: Colors.yellowAccent,
                    //     borderRadius: BorderRadius.circular(90),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: <Widget>[
                    //       Icon(
                    //         Icons.warning,
                    //         size: 60,
                    //       ),
                    //       FlatButton(
                    //         color: Colors.yellowAccent,
                    //         textColor: Colors.black,
                    //         disabledColor: Colors.grey,
                    //         padding: EdgeInsets.all(35.0),
                    //         splashColor: Colors.white,
                    //         onPressed: () {
                    //           _getLocation();
                    //           showAlertDialog2(context);
                    //         },
                    //         child: Text(
                    //           "PEDIR SOCORRO",
                    //           style: TextStyle(fontSize: 22.0),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Button(
                      type: 'help',
                      txtColor: Colors.redAccent,
                      btnColor: Colors.white,
                      labelText: 'PEDIR SOCORRO',
                      callback: () {
                        Navigator.pushNamed(context, '');
                      },
                    ),
                    //Botão denunciar
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 90.0,
                      margin: EdgeInsets.only(left: 6, right: 6, top: 15),
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            color: Colors.yellowAccent,
                            textColor: Colors.black,
                            disabledColor: Colors.grey,
                            padding: EdgeInsets.all(35.0),
                            splashColor: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, '/denuncias');
                            },
                            child: Text(
                              "DENUNCIAR",
                              style: TextStyle(fontSize: 22.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 200.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(188, 32, 224, 1),
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
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            subtitle: Container(
                              child: Text(
                                'This is a Test',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Exo',
                                ),
                              ),
                            ),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {},
                                child: Text(
                                  'TUTORIAL >',
                                  style: TextStyle(
                                    color: Colors.white,
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
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          // Informacoes
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.purple[500],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/info');
                            },
                            child: Icon(
                              Icons.import_contacts,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          // Contatos
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.purple[500],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.local_phone,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          // Agenda
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.purple[500],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/contacts');
                            },
                            child: Icon(
                              Icons.group,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          // Agenda
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.purple[500],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/map');
                            },
                            child: Icon(
                              Icons.map,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
}
