import 'package:arretadas/screens/info/infoPage1.dart';
import 'package:arretadas/screens/info/infoPage2.dart';
import 'package:arretadas/screens/info/infoPage3.dart';
import 'package:arretadas/screens/info/infoPage4.dart';
import 'package:arretadas/screens/info/infoPage5.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({Key key}) : super(key: key);
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: <Widget>[
          Image.asset(
            "assets/Background.jpg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 180.0,
                        child: Stack(children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'assets/Infor_01.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'SITUAÇÕES DE FUGA, A MULHER DEVE LEVAR CONSIGO',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text('Ver Mais'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InforPage1()),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  )),
              Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 180.0,
                        child: Stack(children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'assets/Infor_02.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'DIREITOS REPRODUTIVOS E SEXUAIS DA MULHER',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text('Ver Mais'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InforPage2()),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  )),
              Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 180.0,
                        child: Stack(children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'assets/Infor_03.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'CENTRO ESPECIALIZADO DE ATENDIMENTO À MULHER - CEAM',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text('Ver Mais'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InforPage3()),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  )),
              Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 180.0,
                        child: Stack(children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'assets/Infor_04.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'RELACIONAMENTO ABUSIVO',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text('Ver Mais'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InforPage4()),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  )),
              Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 180.0,
                        child: Stack(children: <Widget>[
                          Positioned.fill(
                            child: Image.asset(
                              'assets/Infor_05.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 16.0,
                            right: 16.0,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'MARIA DA PENHA',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color:
                                            Color.fromRGBO(248, 92, 104, 100)),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text('Ver Mais'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InforPage5()),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  )),
            ],
          )
        ])));
  }
}
