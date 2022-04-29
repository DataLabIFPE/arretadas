import 'package:arretadas/app/core/components/input.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';

import 'package:flutter/material.dart';

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

  var nome;

  @override
  void initState() {
    super.initState();
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
        child: Icon(Icons.save),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            if (widget.id != null &&
                widget.name != null &&
                widget.number != null) {
              await controller.updateContact(Friendcontact(
                  id: widget.id,
                  name: _nameController.text,
                  number: _phoneController.text));
            } else {
              await controller.addContact(Friendcontact(
                  id: '',
                  name: _nameController.text,
                  number: _phoneController.text));
            }
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushNamed(context, '/friendcontacts');
          }
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.94,
              decoration: BoxDecoration(
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
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                          'Sua localização será compartilhada com este contato ao pedir socorro.'),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/icon_person.png"),
                          ),
                        ),
                      ),
                      SizedBox(
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
                      SizedBox(
                        height: 10,
                      ),
                      Input(
                        maxLength: 10,
                        controller: _phoneController,
                        label: 'Telefone',
                        hint: 'DDXXXXXXXX',
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe o telefone.';
                          }
                          String patttern = r'(^[0-9]*$)';
                          RegExp regExp = new RegExp(patttern);
                          if (value.length != 10) {
                            return "O celular deve ter 10 dígitos";
                          } else if (!regExp.hasMatch(value)) {
                            return "O número do celular so deve conter dígitos";
                          }
                          return null;
                        },
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
