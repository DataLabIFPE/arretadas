import 'dart:io';
import 'package:flutter/material.dart';
import 'package:arretadas/helpers/contact_helper.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;
  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  //final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  //final _endressController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;
  Contact _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _phoneController.text = _editedContact.phone;
      //_emailController.text = _editedContact.email;
      //_endressController.text = _editedContact.endress;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.redAccent,
        title: Text(_editedContact.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_editedContact.name != null && _editedContact.name.isNotEmpty) {
            Navigator.pop(context, _editedContact);
          } else {
            FocusScope.of(context).requestFocus(_nameFocus);
          }
        },
        child: Icon(Icons.save),
        //TODO
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      /*image: _editedContact.img != null
                          ? FileImage(File(_editedContact.img))
                          : AssetImage("assets/icon-person.png")),*/
                      image: AssetImage("assets/icon-person.png")),
                ),
              ),
            ),
            //),
            TextField(
              controller: _nameController,
              focusNode: _nameFocus,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                _userEdited = true;
                setState(() {
                  _editedContact.name = text;
                });
              },
            ),
            /*TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.email = text;
              },
              keyboardType: TextInputType.emailAddress,
            ),*/
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: "Telefone"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.phone = text;
              },
              keyboardType: TextInputType.phone,
            ),
            /*TextField(
              controller: _endressController,
              decoration: InputDecoration(labelText: "Endereço"),
              onChanged: (text) {
                _userEdited = true;
                _editedContact.endress = text;
              },
              keyboardType: TextInputType.text,
            ),*/
          ],
        ),
      ),
    );
  }
}
