import 'package:arretadas/models/friendcontact_model.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final FriendContactModel contact;
  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  FriendContactModel _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = FriendContactModel();
    } else {
      _editedContact = FriendContactModel.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _phoneController.text = _editedContact.number;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_editedContact.name != null &&
              _editedContact.number != null &&
              _editedContact.name.isNotEmpty &&
              _editedContact.number.isNotEmpty &&
              _editedContact.name.length >= 3 &&
              _editedContact.number.length >= 3) {
            Navigator.pop(context, _editedContact);
          } else {
            FocusScope.of(context).requestFocus(_nameFocus);
          }
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
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
                      'assets/warning.png',
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
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/icon-person.png")),
                      ),
                    ),
                    TextField(
                      controller: _nameController,
                      focusNode: _nameFocus,
                      decoration: InputDecoration(labelText: "Nome"),
                      onChanged: (text) {
                        setState(() {
                          _editedContact.name = text;
                        });
                      },
                    ),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(labelText: "Telefone"),
                      onChanged: (text) {
                        _editedContact.number = text;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
