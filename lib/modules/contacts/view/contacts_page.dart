import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arretadas/modules/contacts/controller/contacts_controller.dart';

class ContactsPage extends StatelessWidget {
  static const router = '/contacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => ContactController(),
          child: ContactContent(),
        ),
      ),
    );
  }
}

class ContactContent extends StatefulWidget {
  @override
  _ContactContentState createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
