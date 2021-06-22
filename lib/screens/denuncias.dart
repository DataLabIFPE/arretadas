import 'package:arretadas/components/Button.dart';
import 'package:arretadas/exceptions/rest_exception.dart';
import 'package:arretadas/helpers/custom_dio.dart';
import 'package:arretadas/mixins/messages_mixin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Denuncias extends StatefulWidget {
  Denuncias({Key key, this.point}) : super(key: key);
  final point;

  @override
  _DenunciasState createState() => _DenunciasState();
}

class _DenunciasState extends State<Denuncias> with MessagesMixin {
  DateTime pickedDate;
  TimeOfDay time;
  String formattedDate;
  String formattedHour;
  String fh;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    time = TimeOfDay.now();
    formattedHour = DateFormat.jms('pt').format(
      DateTime(pickedDate.year, pickedDate.month, pickedDate.day, time.hour,
          time.minute, 0),
    );
    fh = DateFormat.Hm('pt').format(
      DateTime(pickedDate.year, pickedDate.month, pickedDate.day, time.hour,
          time.minute, 0),
    );
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

  Future<void> _sendMessage1(
    dynamic local,
    String data,
    String hora,
    String tipoViolencia,
  ) async {
    var dio = CustomDio().instance;
    try {
      await dio.post('https://arretadas-api.herokuapp.com/complaint', data: {
        'latitude': local.latitude,
        'longitude': local.longitude,
        'date': data,
        'hour': hora,
        'type_complaint': tipoViolencia,
      });
    } on DioError catch (e) {
      print('Erro na requisição');
      print(e);
      throw RestException('Erro ao enviar alerta');
    }
  }

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
              title: Text("Hora: $fh"),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickTime,
            ),
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
                _sendMessage1(widget.point, formattedDate, formattedHour,
                    _currentViolencia);
                /*showSuccess(
                    message: "Denúncia enviada com sucesso!", context: context);*/
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
        formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
  }

  //função para inicializar a hora
  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
        formattedHour = DateFormat.jms('pt').format(DateTime(pickedDate.year,
            pickedDate.month, pickedDate.day, t.hour, t.minute, 0));
        fh = DateFormat.Hm('pt').format(
          DateTime(pickedDate.year, pickedDate.month, pickedDate.day, time.hour,
              time.minute, 0),
        );
      });
  }
}
