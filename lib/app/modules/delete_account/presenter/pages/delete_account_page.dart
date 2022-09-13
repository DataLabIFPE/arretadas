import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/usecases/delete_account_usecase.dart';
import '../controller/delete_account_controller.dart';
import '../stores/delete_account_store.dart';

// ignore_for_file: unnecessary_non_null_assertion

class DeleteAccountPage extends StatefulWidget {
  final String title;

  const DeleteAccountPage({Key? key, this.title = 'AlertPage'})
      : super(key: key);

  @override
  DeleteAccountPageState createState() => DeleteAccountPageState();
}

class DeleteAccountPageState extends State<DeleteAccountPage>
    with LoaderMixin, MessagesMixin {
  final DeleteAccountStore store = Modular.get();
  late Disposer disposer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _showMyDialog().then((value) => Navigator.of(context).pop());
    });
    disposer = store.observer(
      onError: (error) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        showSnackbar(context, error);
        print(error);
      },
      onLoading: (loading) {
        showHideLoaderHelper(context, loading);
        print(loading);
      },
      onState: (state) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Modular.to.navigate('/home');
        showSucess(context, state);
      },
    );
  }

  @override
  void dispose() {
    store.destroy();
    disposer();
    super.dispose();
  }

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
                Text('Tem certeza que deseja apagar a conta?'),
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
                text: 'apagar',
                fontFamily: 'Exo',
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () async {
                final controller = DeleteAccountController();
                try {
                  final id = await controller.getId();
                  final token = await controller.getToken();
                  store.deleteAccount(
                    DeleteAccountParams(
                      id: id,
                      token: token,
                    ),
                  );
                } on Exception catch (e) {
                  print(e.toString());
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
    );
  }
}
