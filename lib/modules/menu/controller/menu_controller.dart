import 'package:arretadas/exceptions/rest_exception.dart';
import 'package:arretadas/repositories/alert_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MenuController extends ChangeNotifier {
  bool sendSuccess;
  String error;
  final AlertRepository _repository = AlertRepository();

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
            await _repository.sendMessage(coordinators);
            sendSuccess = true;
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
}
