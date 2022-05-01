import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:arretadas/app/modules/complaints/domain/entities/complaint.dart';
import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';
import 'package:arretadas/app/modules/complaints/presenter/checkbox/checkbox_controller.dart';
import 'package:arretadas/app/modules/complaints/presenter/store/complaints_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:intl/intl.dart';

import 'map.dart';

class ComplaintsPage extends StatefulWidget {
  final String title;
  const ComplaintsPage({Key? key, this.title = 'Denúncia'}) : super(key: key);

  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage>
    with MessagesMixin, LoaderMixin {
  final ComplaintsStore store = Modular.get();
  final complaint = Complaint();
  int currentStep = 0;
  late DateTime data;
  late TimeOfDay hora;
  String df = '';
  String hf = '';
  late Disposer disposer;
  final controller = CheckboxController();
  var list = <String>[];

  @override
  void initState() {
    super.initState();
    data = DateTime.now();
    hora = TimeOfDay.now();
    disposer = store.observer(
      onError: (error) {
        showSnackbar(context, error);
      },
      onLoading: (loading) {
        showHideLoaderHelper(context, loading);
      },
      onState: (state) {
        showSnackbar(context, state.hora);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length - 1;
          final isValid = complaint.local != null &&
              complaint.data.isNotEmpty &&
              complaint.hora.isNotEmpty &&
              complaint.tipoViolencia != null &&
              complaint.tipoViolencia!.isNotEmpty;
          if (isLastStep && isValid) {
            final params = ComplaintParams(
                tipoViolencia: complaint.tipoViolencia,
                data: complaint.data,
                hora: complaint.hora,
                local: complaint.local);
            store.sendComplaint(params);
          } else if (isLastStep) {
            showSnackbar(context, 'Campos inválidos. Preencha corretamente!');
          } else {
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepTapped: (value) {
          setState(() {
            currentStep = value;
          });
        },
        onStepCancel: currentStep == 0
            ? null
            : () {
                setState(
                  () {
                    currentStep -= 1;
                  },
                );
              },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          final isLastStep = currentStep == getSteps().length - 1;
          return Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Text(isLastStep ? 'ENVIAR' : 'CONTINUAR'),
                    onPressed: details.onStepContinue,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                if (currentStep != 0)
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        primary: Colors.grey,
                      ),
                      child: const Text('VOLTAR'),
                      onPressed: details.onStepCancel,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text('Tipo'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Escolha um ou mais tipos'.toUpperCase(),
              style: const TextStyle(fontSize: 16.0),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: (controller.itens1.length),
                    itemBuilder: (context, index) {
                      var todo = controller.itens1[index];
                      return CheckboxListTile(
                        title: Text(todo.name),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: todo.selected,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              todo.selected = value;
                              if (todo.selected) {
                                list.add(todo.name);
                                complaint.tipoViolencia = list;
                              } else if (list.contains(todo.name)) {
                                list.remove(todo.name);
                                complaint.tipoViolencia = list;
                              }
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: (controller.itens2.length),
                    itemBuilder: (context, index) {
                      var todo = controller.itens2[index];
                      return CheckboxListTile(
                        title: Text(
                          todo.name,
                          style: const TextStyle(fontSize: 15),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: todo.selected,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              todo.selected = value;
                              if (todo.selected) {
                                list.add(todo.name);
                                complaint.tipoViolencia = list;
                              } else if (list.contains(todo.name)) {
                                list.remove(todo.name);
                                complaint.tipoViolencia = list;
                              }
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text('Quando'),
        content: Column(
          children: [
            ListTile(
              title: Text('Data: $df'),
              leading: const Icon(Icons.calendar_today),
              trailing: const Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                data = await pickDate(context);
                setState(() {
                  df = DateFormat('dd/MM/yyyy').format(data);
                  complaint.data = DateFormat('yyyy-MM-dd').format(data);
                });
              },
            ),
            ListTile(
              title: Text('Hora: $hf'),
              leading: const Icon(Icons.access_time),
              trailing: const Icon(Icons.keyboard_arrow_down),
              onTap: () async {
                hora = await pickTime(context);
                setState(() {
                  hf = hora.format(context);
                  complaint.hora = DateFormat.jms('pt').format(DateTime(
                      data.year,
                      data.month,
                      data.day,
                      hora.hour,
                      hora.minute,
                      0));
                });
              },
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text('Local'),
        content: Column(
          children: [
            const Text('Clique no mapa para adicionar a localização'),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.8,
              child: GestureDetector(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Mapa(),
                    ),
                  );
                  setState(() {
                    complaint.local = result;
                  });
                },
                child: const Image(
                  image: AssetImage('assets/images/map.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: const Text(''),
        content: Card(
          child: Column(
            children: [
              ListTile(
                leading: const Text(
                  'Tipo de Violência:',
                  style: TextStyle(fontSize: 17),
                ),
                title: Text(complaint.tipoViolencia != null
                    ? '${complaint.tipoViolencia}'
                    : 'Inválido'),
              ),
              ListTile(
                leading: const Text(
                  'Data:',
                  style: TextStyle(fontSize: 17),
                ),
                title: Text(complaint.data.isNotEmpty ? df : 'Inválida'),
              ),
              ListTile(
                leading: const Text(
                  'Hora:',
                  style: TextStyle(fontSize: 17),
                ),
                title: Text(complaint.hora.isNotEmpty ? hf : 'Inválida'),
              ),
              ListTile(
                leading: const Text(
                  'Local:',
                  style: TextStyle(fontSize: 17),
                ),
                title: Text(complaint.local != null ? 'Válido' : 'Inválido'),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime.now(),
    );
    if (data != null) {
      return data;
    } else {
      return DateTime.now();
    }
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      return time;
    } else {
      return TimeOfDay.now();
    }
  }
}
