import 'package:arretadas/app/modules/friendcontacts/presenter/store/friendcontacts_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

import '../friendcontacts_controller.dart';
import 'contact_page.dart';

class FriendcontactDetails extends StatefulWidget {
  final String id;
  final String name;
  final String number;
  final int index;
  const FriendcontactDetails(
      {Key? key,
      required this.id,
      required this.name,
      required this.number,
      required this.index})
      : super(key: key);

  @override
  _FriendcontactDetailsState createState() => _FriendcontactDetailsState();
}

class _FriendcontactDetailsState extends State<FriendcontactDetails> {
  final FriendcontactsStore store = Modular.get();
  final controller = FriendContactController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.person_pin,
                              color: Theme.of(context).primaryColor,
                              size: 40,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.phone,
                                  color: Theme.of(context).primaryColor,
                                  size: 40)),
                          Text(widget.number,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18.0,
                                  fontStyle: FontStyle.italic))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.phone, color: Theme.of(context).primaryColor),
                    Text(
                      "Ligar",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                onPressed: () {
                  launch("tel:$widget.number");
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Column(children: <Widget>[
                  Icon(Icons.cached, color: Theme.of(context).primaryColor),
                  Text(
                    "Editar",
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).primaryColor),
                  )
                ]),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactPage(
                        id: widget.id,
                        name: widget.name,
                        number: widget.number,
                      ),
                    ),
                  );
                },
              ),
              TextButton(
                child: Column(children: <Widget>[
                  Icon(Icons.delete, color: Theme.of(context).primaryColor),
                  Text(
                    "Deletar",
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).primaryColor),
                  )
                ]),
                onPressed: () async {
                  await controller.deleteContact(widget.id);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/friendcontacts');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
