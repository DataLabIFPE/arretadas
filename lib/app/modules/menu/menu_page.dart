import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/modules/alert/alert_module.dart';
import 'package:arretadas/app/modules/change_password/change_password_module.dart';
import 'package:arretadas/app/modules/menu/dialogs/policy_dialog.dart';
import 'package:arretadas/app/modules/menu/menu_controller.dart';
import 'package:arretadas/app/modules/menu/menu_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../delete_account/delete_account_module.dart';

class MenuPage extends StatefulWidget {
  final String title;

  const MenuPage({Key? key, this.title = 'MenuPage'}) : super(key: key);

  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  final MenuStore store = Modular.get();
  final controller = MenuController();
  late String id;
  late String nickname;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> getProps() async {
    id = await controller.getId();
    nickname = await controller.getNickname();
  }

  @override
  void initState() {
    super.initState();
    getProps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.45,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset('assets/images/icon_person.png',
                        color: AppColors.primaryColorAccent),
                  ),
                  const TextCustom(
                    text: 'Configurações',
                    fontFamily: 'exo',
                  ),
                ],
              ),
            ),
            ListTile(
              title: const TextCustom(
                text: 'mudar senha',
                color: Colors.black54,
                fontFamily: 'Exo',
              ),
              onTap: () {
                Modular.to.push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) {
                      return ChangePasswordModule(
                        id: id,
                        nickname: nickname,
                      );
                    }));
              },
            ),
            ListTile(
              title: const TextCustom(
                text: 'apagar conta',
                color: Colors.black54,
                fontFamily: 'Exo',
              ),
              onTap: () {
                Modular.to.push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (BuildContext context, _, __) {
                      return DeleteAccountModule();
                    }));
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 15),
              title: const TextCustom(
                text: 'Termos e Condições',
                color: Colors.black54,
                fontFamily: 'Exo',
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return PolicyDialog(mdFileName: 'privacy_policy.md');
                  },
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                store.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              child: const TextCustom(
                text: 'sair',
                color: AppColors.primaryColor,
                fontFamily: 'Exo',
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
      key: _scaffoldKey,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Arretadas',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                      child: Container(
                        height: 75,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset('assets/images/icon_person.png',
                            color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                Button(
                    margin: const EdgeInsets.only(top: 20),
                    width: (MediaQuery.of(context).size.width * 0.95),
                    height: 70,
                    buttonColor: AppColors.primaryColor.shade600,
                    child: const TextCustom(
                      text: 'pedir socorro',
                      fontSize: 18,
                    ),
                    onPressed: () {
                      Modular.to.push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return AlertModule();
                          }));
                    }),
                Button(
                  margin: const EdgeInsets.only(top: 20),
                  width: (MediaQuery.of(context).size.width * 0.95),
                  height: 70,
                  buttonColor: AppColors.primaryColor.shade600,
                  child: const TextCustom(
                    text: 'denunciar',
                    fontSize: 18,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/complaints');
                  },
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button(
                      child: const Icon(
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
                      child: const Icon(
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
                      child: const Icon(
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
          ],
        ),
      ),
    );
  }
}
