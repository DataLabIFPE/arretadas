import 'package:arretadas/components/Button.dart';
import 'package:arretadas/core/app_colors.dart';
import 'package:arretadas/mixins/messages_mixin.dart';
import 'package:arretadas/modules/complaints/controller/complaints_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class ComplaintsPage extends StatelessWidget {
  const ComplaintsPage({Key key, this.point}) : super(key: key);
  static const router = '/complaints';
  final point;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Denúncias'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => ComplaintsController(),
          child: ComplaintsContent(
            point: point,
          ),
        ),
      ),
    );
  }
}

class ComplaintsContent extends StatefulWidget {
  const ComplaintsContent({Key key, this.point}) : super(key: key);
  final point;

  @override
  _ComplaintsContentState createState() => _ComplaintsContentState();
}

class _ComplaintsContentState extends State<ComplaintsContent>
    with MessagesMixin {
  String dropdownValue = 'Sexual';
  DateTime pickedDate;
  TimeOfDay pickedTime;
  String data, hora, _df, _hf, _hmf;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    pickedTime = TimeOfDay.now();

    _df = DateFormat('yyyy-MM-dd').format(pickedDate);

    _hf = DateFormat.jms('pt').format(DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
        0));

    _hmf = DateFormat.Hm('pt').format(DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
        0));

    data = _df;
    hora = _hf;

    final controller = context.read<ComplaintsController>();
    controller.addListener(() {
      if (!isNull(controller.error)) {
        showError(message: controller.error, context: context);
      }

      if (controller.sendSucess) {
        showSuccess(message: 'Denúncia enviada com Sucesso', context: context);
        Future.delayed(Duration(milliseconds: 350), () {
          Navigator.pop(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        Container(
          padding: new EdgeInsets.all(20),
        ),
        Text('Selecione o tipo de violência'),
        DropdownButton<String>(
          hint: Container(
            width: 320,
          ),
          value: dropdownValue,
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: AppColors.primaria,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>[
            'Sexual',
            'Moral',
            'Verbal',
            'Física',
            'Psicológica',
            'Patrimonial',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Container(
          padding: new EdgeInsets.all(20),
        ),
        ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text(DateFormat("'Data:' dd/MM/yyyy").format(pickedDate)),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: _pickDate,
        ),
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text("Hora: $_hmf"),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: _pickTime,
        ),
        Container(
          padding: new EdgeInsets.all(20),
        ),
        Button(
            btnColor: AppColors.primaria,
            child: Text(
              'Enviar',
              style: TextStyle(
                  color: AppColors.fonts,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            callback: () {
              context
                  .read<ComplaintsController>()
                  .sendComplaint(widget.point, data, hora, dropdownValue);
            }),
      ]),
    );
  }

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
        data = _df;
      });
  }

  _pickTime() async {
    TimeOfDay t =
        await showTimePicker(context: context, initialTime: pickedTime);
    if (t != null)
      setState(() {
        pickedTime = t;
        hora = _hf;
        _hmf = _hmf;
      });
  }
}
