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
      home: Widgets1(),
    );
  }
}

class Widgets1 extends StatefulWidget {
  @override
  _Widgets1State createState() => _Widgets1State();
}

class _Widgets1State extends State<Widgets1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Fazer Denúncias"),
              bottom: TabBar(tabs: <Widget>[
                Text("Localização"),
                Text("Instruções"),
              ]),
            ),
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  TabBarView(
                    children: <Widget>[
                      Map(),
                      new Container(
                        child: Center(
                          child: FlatButton.icon(
                            color: Color.fromRGBO(248, 92, 104, 1),
                            icon: Icon(Icons.add_location),
                            label: Text(
                                "Essa tela vai exibir informações sobre o uso do mapa"),
                            onPressed: () {
                              debugPrint("Localizando");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

//    Navegação entre telas
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(248, 92, 104, 1),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
              ),
              unselectedIconTheme: const IconThemeData(
                color: Colors.white,
              ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Voltar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.home,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Início',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )));
  }
}
