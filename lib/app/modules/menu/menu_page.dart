import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:arretadas/app/modules/menu/menu_store.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key? key, this.title = 'MenuPage'}) : super(key: key);
  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  final MenuStore store = Modular.get();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Deseja enviar o pedido de socorro?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: TextCustom(
                text: 'cancelar',
                fontFamily: 'Exo',
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: TextCustom(
                text: 'enviar',
                fontFamily: 'Exo',
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Arretadas',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo',
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          store.signOut();
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil('/', (route) => false);
                        },
                        child: TextCustom(
                          text: 'sair',
                          color: AppColors.primaryColor,
                          fontFamily: 'Exo',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Button(
                      margin: EdgeInsets.only(top: 20),
                      width: (MediaQuery.of(context).size.width * 0.95),
                      height: 70,
                      buttonColor: AppColors.primaryColor.shade600,
                      child: TextCustom(
                        text: 'pedir socorro',
                        fontSize: 18,
                      ),
                      onPressed: () => _showMyDialog()),
                  Button(
                    margin: EdgeInsets.only(top: 20),
                    width: (MediaQuery.of(context).size.width * 0.95),
                    height: 70,
                    buttonColor: AppColors.primaryColor.shade600,
                    child: TextCustom(
                      text: 'denunciar',
                      fontSize: 18,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/complaints');
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Button(
                        child: Icon(
                          Icons.import_contacts,
                          size: 50,
                          color: AppColors.primaryColor,
                        ),
                        width: 80.0,
                        height: 80.0,
                        buttonColor: AppColors.primaryColor.shade100,
                        onPressed: () {
                          Navigator.pushNamed(context, '/info');
                        },
                      ),
                      Button(
                        child: Icon(
                          Icons.local_phone,
                          size: 50,
                          color: AppColors.primaryColor,
                        ),
                        width: 80.0,
                        height: 80.0,
                        buttonColor: AppColors.primaryColor.shade100,
                        onPressed: () {
                          Navigator.pushNamed(context, '/usefulcontacts');
                        },
                      ),
                      Button(
                        child: Icon(
                          Icons.group,
                          size: 50,
                          color: AppColors.primaryColor,
                        ),
                        width: 80.0,
                        height: 80.0,
                        buttonColor: AppColors.primaryColor.shade100,
                        onPressed: () {
                          Navigator.pushNamed(context, '/friendcontacts');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
