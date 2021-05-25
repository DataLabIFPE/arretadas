import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:async';
//import 'package:intl/intl.dart';
//import 'package:mapbox_gl/mapbox_gl.dart';
import 'mapa.dart';

import 'package:arretadas/screens/mapa.dart';

//void funcao_temporaria() {
//  Map();
//}

/*Widget icone_alerta = Icon(
  Icons.warning,
  size: 10,
);*/

// class Denuncias extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Fazer Denúncias",
//       theme: ThemeData(
//         primaryColor: Color.fromRGBO(248, 92, 104, 1),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Fazer Denúncias"),
//         ),
//         body: MapaDenunciar(),
//       ),
//     );
//   }
// }

class Denuncias extends StatefulWidget {
  Denuncias({Key key, this.point});
  final point;
  @override
  _DenunciasState createState() => _DenunciasState();
}

class _DenunciasState extends State<Denuncias> {
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
        body: MapaDenunciar(point: widget.point),
      ),
    );
  }
}

class MapaDenunciar extends StatefulWidget {
  MapaDenunciar({Key key, this.point}) : super(key: key);
  final point;

  @override
  _MapaDenunciarState createState() => _MapaDenunciarState();
}

class _MapaDenunciarState extends State<MapaDenunciar> {
  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentViolencia = _dropDownMenuItems[0].value;
  }

  List _tiposViolencias = [
    "Espancamento",
    "Atirar objetos, sacudir e apertar os braços",
    "Estrangulamento ou sufocamento",
    "Lesões com objetos cortantes ou perfurantes",
    "Tortura",
    "Ameaças",
    "Constrangimento",
    "Humilhação",
    "Manipulação",
    "Isolamento (proibir de estudar e viajar ou de falar com amigos e parentes)",
    "Vigilância constante",
    "Perseguição contumaz",
    "Insultos",
    "Chantagem",
    "Exploração",
    "Limitação do direito de ir e vir",
    "Ridicularização",
    "Tirar a liberdade de crença",
    "Distorcer e omitir fatos para deixar a mulher em dúvida sobre a sua memória e sanidade",
    "Estupro",
    "Obrigar a mulher a fazer atos sexuais que causam desconforto ou repulsa",
    "Impedir o uso de métodos contraceptivos ou forçar a mulher a abortar",
    "Forçar matrimônio, gravidez ou prostituição por meio de coação, chantagem ou suborno",
    "Limitar ou anular o exercício dos direitos sexuais e reprodutivos da mulher",
    "Controlar o dinheiro",
    "Deixar de pagar pensão alimentícia",
    "Destruição de documentos pessoais",
    "Furto, extorsão ou dano",
    "Estelionato",
    "Privar de bens, valores ou recursos econômicos",
    "Causar danos propositais a objetos da mulher ou dos quais ela goste",
    "Acusar a mulher de traição",
    "Emitir juízos morais sobre a conduta",
    "Fazer críticas mentirosas",
    "Expor a vida íntima",
    "Rebaixar a mulher por meio de xingamentos que incidem sobre a sua índole",
    "Desvalorizar a vítima pelo seu modo de se vestir"
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentViolencia;

  /* @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentViolencia = _dropDownMenuItems[0].value;
    super.initState();
  }*/

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String violencia in _tiposViolencias) {
      items.add(
          new DropdownMenuItem(value: violencia, child: new Text(violencia)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Container(
        color: Colors.white,
        child: new Center(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Selecione o tipo de violência"),
            new Container(
              padding: new EdgeInsets.all(14.0),
            ),
            new DropdownButton(
              isExpanded: true,
              value: _currentViolencia,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            ),
            Icon(Icons.calendar_today),
            ListTile(
              title: Text(
                  "Data: ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            Icon(Icons.access_time),
            ListTile(
              title: Text("Hora: ${time.hour}:${time.minute}"),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickTime,
            ),
            Text("Clique no mapa para adicionar a localização"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => SetMap(),
                  ),
                );
              },
              child: Image(
                image: AssetImage('assets/foto_mapa.png'),
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                //TODO
              },
              label: Text("Enviar"),
              icon: Icon(Icons.navigation),
              backgroundColor: Colors.black,
              elevation: 0,
            ),
          ],
        )),
      ),
    );
  }

  void changedDropDownItem(String selectedVIOLENCIA) {
    setState(() {
      _currentViolencia = selectedVIOLENCIA;
    });
  }

  // função para inicializar a data
  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null)
      setState(() {
        pickedDate = date;
      });
  }

  //função para inicializar a hora
  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
      });
  }
}
