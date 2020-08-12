import 'package:flutter/material.dart';
import 'alerta.dart';

class Menu extends StatelessWidget {
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
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Olá, Boa tarde !',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Beltrana da Silva',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Exo',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset('assets/icon-person.png')),
                      ],
                    ),
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
                          Icon(
                            Icons.warning,
                            size: 60,
                          ),
                          FlatButton(
                            color: Colors.yellowAccent,
                            textColor: Colors.black,
                            disabledColor: Colors.grey,
                            padding: EdgeInsets.all(35.0),
                            splashColor: Colors.white,
                            onPressed: () {
                              showAlertDialog2(context);
                            },
                            child: Text(
                              "PEDIR SOCORRO",
                              style: TextStyle(fontSize: 22.0),
                            ),
                          ),
                        ],
                      ),
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
                                'BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA BLA',
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
                'Back',
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
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Pesquisar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
