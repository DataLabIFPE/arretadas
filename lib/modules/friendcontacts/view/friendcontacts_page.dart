import 'package:arretadas/models/friendcontact_model.dart';
import 'package:arretadas/modules/friendcontacts/controller/friendcontacts_controller.dart';
import 'package:arretadas/modules/friendcontacts/view/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

class FriendContactsPage extends StatelessWidget {
  static const router = '/contacts';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => FriendContactController()..findFriendcontacts(),
        child: FriendContactContent(),
      ),
    );
  }
}

class FriendContactContent extends StatefulWidget {
  @override
  _FriendContactContentState createState() => _FriendContactContentState();
}

class _FriendContactContentState extends State<FriendContactContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amigos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      body: Consumer<FriendContactController>(builder: (_, controller, __) {
        if (controller.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!isNull(controller.error)) {
          return Center(child: Text(controller.error));
        }
        var friendcontacts = controller.friendcontact;
        return ListView.builder(
            itemCount: friendcontacts.length,
            itemBuilder: (context, index) {
              var item = friendcontacts[index];
              return GestureDetector(
                child: Card(
                  child: ListTile(
                    title: Text(
                      item.name,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    subtitle: Text(
                      item.number,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.phone),
                      iconSize: 30,
                      onPressed: () {
                        launch("tel:${item.number}");
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                onTap: () {
                  showModalBottom(
                      context, item, _, friendcontacts, index, controller);
                },
              );
            });
      }),
    );
  }

  Future<dynamic> showModalBottom(
      BuildContext context,
      FriendContactModel item,
      BuildContext _,
      List<FriendContactModel> friendcontacts,
      int index,
      FriendContactController controller) {
    return showModalBottomSheet(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          Expanded(
                                            child: Text(item.name ?? "",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontSize: 20.0,
                                                    fontStyle:
                                                        FontStyle.italic)),
                                          )
                                        ]),
                                        Row(children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.phone,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 40)),
                                          Text(item.number,
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
                              Icon(Icons.phone,
                                  color: Theme.of(context).primaryColor),
                              Text(
                                "Ligar",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Theme.of(context).primaryColor),
                              )
                            ]),
                            onPressed: () {
                              launch("tel:${item.number}");
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Column(children: <Widget>[
                              Icon(Icons.cached,
                                  color: Theme.of(context).primaryColor),
                              Text(
                                "Editar",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Theme.of(context).primaryColor),
                              )
                            ]),
                            onPressed: () {
                              Navigator.pop(context);
                              _showContactPage(_,
                                  contact: friendcontacts[index]);
                            },
                          ),
                          TextButton(
                            child: Column(children: <Widget>[
                              Icon(Icons.delete,
                                  color: Theme.of(context).primaryColor),
                              Text(
                                "Deletar",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Theme.of(context).primaryColor),
                              )
                            ]),
                            onPressed: () {
                              controller
                                  .deleteContact(friendcontacts[index].id);
                              setState(() {
                                friendcontacts.removeAt(index);
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        });
  }

  Future<void> _showContactPage(BuildContext context,
      {FriendContactModel contact}) async {
    final controller = context.read<FriendContactController>();
    final recContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactPage(contact: contact)));
    if (recContact != null) {
      if (contact != null) {
        controller.updateContact(recContact);
        Navigator.pushReplacementNamed(context, FriendContactsPage.router);
      } else {
        await controller.addContact(recContact);
        Navigator.pushReplacementNamed(context, FriendContactsPage.router);
      }
    }
  }
}
