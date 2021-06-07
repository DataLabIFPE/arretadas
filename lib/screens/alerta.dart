import 'package:flutter/material.dart';

showAlertDialog2(BuildContext context) {
  Widget cancelaButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continuaButton = TextButton(
    child: Text("Enviar"),
    onPressed: () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text("Atenção"),
    content: Text("Deseja enviar o pedido de socorro?"),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
