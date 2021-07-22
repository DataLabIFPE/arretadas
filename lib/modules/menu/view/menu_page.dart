import 'package:arretadas/components/Button.dart';
import 'package:arretadas/components/Header.dart';
import 'package:arretadas/mixins/messages_mixin.dart';
import 'package:arretadas/modules/complaints/view/complaints_page.dart';
import 'package:arretadas/modules/friendcontacts/view/friendcontacts_page.dart';
import 'package:arretadas/modules/map/view/map_page.dart';
import 'package:arretadas/modules/menu/components/warning.dart';

import 'package:arretadas/modules/splash/view/splash_page.dart';
import 'package:arretadas/modules/usefulcontacts/view/usefulcontacts_page.dart';
import 'package:flutter/material.dart';
import 'package:arretadas/modules/menu/controller/menu_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart';

class MenuPage extends StatelessWidget {
  static const router = '/menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (_) => MenuController(),
          child: MenuContent(),
        ),
      ),
    );
  }
}

class MenuContent extends StatefulWidget {
  @override
  _MenuContentState createState() => _MenuContentState();
}

class _MenuContentState extends State<MenuContent> with MessagesMixin {
  @override
  void initState() {
    super.initState();
    final controller = context.read<MenuController>();
    controller.addListener(() {
      if (!isNull(controller.error)) {
        showError(message: controller.error, context: context);
      }
      if (controller.sendSuccess) {
        showSuccess(message: 'Pedido enviado com sucesso!', context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Header(
                      title: 'Arretadas',
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset('assets/icon-person.png')),
                  ],
                ),
                Button(
                  width: (MediaQuery.of(context).size.width * 0.95),
                  margin: EdgeInsets.only(top: 20.0),
                  height: 70.0,
                  txtColor: Colors.white,
                  btnColor: Colors.redAccent,
                  fontSize: 20.0,
                  child: Text(
                    'PEDIR SOCORRO',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  callback: () async {
                    context.read<MenuController>().sendMessage(context);
                  },
                ),
                Button(
                  width: (MediaQuery.of(context).size.width * 0.95),
                  height: 70.0,
                  margin: EdgeInsets.only(top: 20.0),
                  txtColor: Colors.white,
                  btnColor: Colors.red[600],
                  fontSize: 18.0,
                  child: Text(
                    'DENUNCIAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  callback: () {
                    Navigator.pushNamed(context, ComplaintsPage.router);
                  },
                ),
                Warning(),
              ],
            ),
          ),
          Container(),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Button(
                      child: Icon(
                        Icons.import_contacts,
                        size: 50,
                        color: Colors.white,
                      ),
                      btnColor: Colors.red[300],
                      width: 80.0,
                      height: 80.0,
                      callback: () {
                        Navigator.pushNamed(context, '/info');
                      },
                    ),
                    Button(
                      child: Icon(
                        Icons.local_phone,
                        size: 50,
                        color: Colors.white,
                      ),
                      btnColor: Colors.red[300],
                      width: 80.0,
                      height: 80.0,
                      callback: () {
                        Navigator.pushNamed(context, UsefulcontactsPage.router);
                      },
                    ),
                    Button(
                      child: Icon(
                        Icons.group,
                        size: 50,
                        color: Colors.white,
                      ),
                      btnColor: Colors.red[300],
                      width: 80.0,
                      height: 80.0,
                      callback: () {
                        Navigator.pushNamed(context, FriendContactsPage.router);
                      },
                    ),
                    Button(
                      child: Icon(
                        Icons.location_on_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                      btnColor: Colors.red[300],
                      width: 80.0,
                      height: 80.0,
                      callback: () {
                        Navigator.pushNamed(context, MapPage.router);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: TextButton(
                        onPressed: () {
                          SharedPreferences.getInstance().then((sp) {
                            sp.clear();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                SplashPage.router, (route) => false);
                          });
                        },
                        child: Text('Sair'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
