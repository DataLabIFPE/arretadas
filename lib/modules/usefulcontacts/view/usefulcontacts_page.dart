import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arretadas/modules/usefulcontacts/controller/useful_controller.dart';

class UsefulcontactsPage extends StatelessWidget {
  static const router = '/usefulcontacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (context) => UsefulController(),
            child: UsefulContent(),
          ),
        ),
      ),
    );
  }
}

class UsefulContent extends StatefulWidget {
  @override
  _UsefulContentState createState() => _UsefulContentState();
}

class _UsefulContentState extends State<UsefulContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Contatos");
  }
}
