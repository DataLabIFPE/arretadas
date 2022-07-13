// ignore_for_file: unnecessary_const, prefer_typing_uninitialized_variables
import 'package:arretadas/app/core/components/input.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../domain/entities/friendcontact.dart';
import '../friendcontacts_controller.dart';

class ContactPage extends StatefulWidget {
  final String title;
  final id;
  final name;
  final number;
  const ContactPage(
      {Key? key, this.title = 'Novo contato', this.name, this.number, this.id})
      : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final controller = FriendContactController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late bool isButtonDisabled;

  var nome;

  @override
  void initState() {
    super.initState();
    isButtonDisabled = false;
    if (widget.name != null && widget.number != null) {
      _nameController.text = widget.name;
      _phoneController.text = widget.number;
      nome = widget.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nome ?? widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: isButtonDisabled
            ? null
            : () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  setState(() {
                    isButtonDisabled = true;
                  });

                  if (widget.id != null &&
                      widget.name != null &&
                      widget.number != null) {
                    await controller.updateContact(Friendcontact(
                        id: widget.id,
                        name: _nameController.text,
                        number: _phoneController.text
                            .replaceAll(RegExp(r'\D'), '')));
                  } else {
                    await controller.addContact(Friendcontact(
                        id: '',
                        name: _nameController.text,
                        number: _phoneController.text
                            .replaceAll(RegExp(r'\D'), '')));
                  }
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/friendcontacts');
                }
              },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/warning.png',
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Text(
                          'Sua localização será compartilhada com este contato ao pedir socorro.'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/icon_person.png"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Input(
                        onChanged: (s) {
                          setState(() {
                            nome = s;
                          });
                        },
                        controller: _nameController,
                        label: 'Nome',
                        hint: 'Informe o nome',
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Informe o nome.';
                          }
                          if (text.length < 3) {
                            return 'Use 3 caracteres ou mais. (Possui ${text.length})';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '(##)####-####',
                            filter: {"#": RegExp(r'[0-9]')},
                            type: MaskAutoCompletionType.lazy,
                          ),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Telefone',
                          hintText: '(XX)XXXX-XXXX',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe o telefone.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
