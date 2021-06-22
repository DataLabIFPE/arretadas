import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arretadas/modules/usefulcontacts/controller/useful_controller.dart';
import 'package:validators/validators.dart';
import 'package:url_launcher/url_launcher.dart';

class UsefulcontactsPage extends StatelessWidget {
  static const router = '/usefulcontacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => UsefulController()..findUsefulcontacts(),
          child: UsefulContent(),
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UsefulController>(builder: (_, controller, __) {
      if (controller.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (!isNull(controller.error)) {
        return Text(controller.error);
      }
      var usefulcontacts = controller.usefulcontacts;
      print(usefulcontacts[0].name);
      return ListView.builder(
          itemCount: usefulcontacts.length,
          itemBuilder: (context, index) {
            var item = usefulcontacts[index];
            return GestureDetector(
              child: Card(
                child: ListTile(
                  title: Text(
                    item.number,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  subtitle: Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    iconSize: 30,
                    onPressed: () {},
                  ),
                ),
              ),
              onTap: () {
                _showUsefulContacts(context, item.number, item.name);
              },
            );
          });
    });
  }
}

void _showUsefulContacts(BuildContext context, number, name) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(
                                              Icons.person_pin,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 40,
                                            )),
                                        Text(name ?? "",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 20.0,
                                                fontStyle: FontStyle.italic))
                                      ]),
                                      Row(children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(Icons.phone,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 40)),
                                        Text(number,
                                            overflow: TextOverflow.clip,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 18.0,
                                                fontStyle: FontStyle.italic))
                                      ]),
                                    ],
                                  )),
                            ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          child: Column(children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              "Ligar",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0),
                            )
                          ]),
                          onPressed: () {
                            launch("tel:$number");
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Column(children: <Widget>[
                            Icon(
                              Icons.map, //mode_edit,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              "Mapa",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0),
                            )
                          ]),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: Column(children: <Widget>[
                            Icon(
                              Icons.email, //delete,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0),
                            )
                          ]),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              );
            });
      });
}
