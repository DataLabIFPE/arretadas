import 'package:flutter/material.dart';

showAlertDialog2(BuildContext context) {
  Widget cancelaButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {},
  );
  Widget continuaButton = TextButton(
    child: Text("Continar"),
    onPressed: () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text("Atenção"),
    content: Text("Deseja continuar o pedido de socorro?"),
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
