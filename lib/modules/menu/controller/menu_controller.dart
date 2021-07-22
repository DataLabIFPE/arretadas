import 'dart:convert';

import 'package:arretadas/exceptions/rest_exception.dart';
import 'package:arretadas/repositories/alert_repository.dart';
import 'package:arretadas/repositories/friendcontact_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuController extends ChangeNotifier {
  bool sendSuccess;
  String error;
  final AlertRepository _repository = AlertRepository();
  final FriendContactRepository _fcRepository = FriendContactRepository();

  sendMessage(BuildContext context) {
    error = null;
    sendSuccess = false;
    _showAlertDialog(context);
    notifyListeners();
  }

  Future<Position> getLocation() async {
    final location = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return location;
  }

  _showAlertDialog(BuildContext context) {
    var friendcontacts = [];

    Widget cancelaButton = TextButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continuaButton = TextButton(
        child: Text("Enviar"),
        onPressed: () async {
          Navigator.pop(context);
          try {
            var coordinators = await getLocation();
            final sp = await SharedPreferences.getInstance();
            var valor = sp.getString("user");
            var valorMap = json.decode(valor);
            var id = valorMap['id'].toString();
            friendcontacts = await _fcRepository.findAllById(id);
            if (friendcontacts.isNotEmpty) {
              await _repository.sendMessage(coordinators);
              sendSuccess = true;
            } else {
              error = 'Erro ao enviar pedido de socorro!';
            }
          } on RestException catch (e) {
            error = e.message;
            sendSuccess = false;
          } catch (e) {
            error = 'Erro ao enviar pedido de socorro!';
            sendSuccess = false;
          } finally {
            notifyListeners();
          }
        });

    AlertDialog alert = AlertDialog(
      title: Text('Atenção'),
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
}
