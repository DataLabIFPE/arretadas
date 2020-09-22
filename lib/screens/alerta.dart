import 'package:flutter/material.dart';

showAlertDialog2(BuildContext context) {
  Widget cancelaButton = FlatButton(
    child: Text("Cancelar"),
    onPressed: () {},
  );
  Widget continuaButton = FlatButton(
    child: Text("Continar"),
    onPressed: () {},
  );

  AlertDialog alert = AlertDialog(
    title: Text("Atenção"),
    content: Text("Deseja continuar o pedido de socorro ?"),
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
