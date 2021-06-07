import 'package:arretadas/components/Button.dart';
import 'package:arretadas/mixins/messages_mixin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'mapa.dart';

import 'package:arretadas/screens/mapa.dart';

class Denuncias extends StatefulWidget {
  Denuncias({Key key, this.point}) : super(key: key);
  final point;

  @override
  _DenunciasState createState() => _DenunciasState();
}

class _DenunciasState extends State<Denuncias> with MessagesMixin {
  DateTime pickedDate;
  TimeOfDay time;

  @override
  void initState() {
    super.initState();
    print(widget.point);
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    _dropDownMenuItems = getDropDownMenuItems();
    _currentViolencia = _dropDownMenuItems[0].value;
  }

  List _tiposViolencias = [
    'Sexual',
    'Moral',
    'Verbal',
    'Física',
    'Psicológica',
    'Patrimonial'
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentViolencia;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Denúncias'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: new EdgeInsets.all(20.0),
            ),
            Text("Selecione o tipo de violência"),
            DropdownButton(
              hint: Container(
                alignment: Alignment.center,
                width: 320,
              ),
              isExpanded: false,
              value: _currentViolencia,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            ),
            Container(
              padding: new EdgeInsets.all(5.0),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(DateFormat("'Data:' dd/MM/yyyy").format(pickedDate)),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Hora: ${time.hour}:${time.minute}"),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickTime,
            ),

            /*Text("Clique no mapa para adicionar a localização"),
            SizedBox(
              height: 20,
            ),*/
            /*GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetMap(),
                  ),
                );
              },
              child: Image(
                image: AssetImage('assets/foto_mapa.png'),
                height: 250,
                fit: BoxFit.contain,
              ),
            ),*/
            SizedBox(
              height: 20,
            ),
            Button(
              btnColor: Colors.redAccent,
              child: Text(
                'ENVIAR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              callback: () {
                showSuccess(
                    message: "Denúncia enviada com sucesso!", context: context);
              },
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
        locale: Localizations.localeOf(context));
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

  /*
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
*/

 