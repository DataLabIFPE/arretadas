import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:arretadas/app/modules/alert/domain/usecases/alert_usecase.dart';
import 'package:arretadas/app/modules/alert/presenter/controller/alert_controller.dart';
import 'package:arretadas/app/modules/alert/presenter/stores/alert_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class AlertPage extends StatefulWidget {
  final String title;
  const AlertPage({Key? key, this.title = 'AlertPage'}) : super(key: key);
  @override
  AlertPageState createState() => AlertPageState();
}

class AlertPageState extends State<AlertPage> with LoaderMixin, MessagesMixin {
  final AlertStore store = Modular.get();
  late Disposer disposer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      _showMyDialog().then((value) => Navigator.of(context).pop());
    });
    disposer = store.observer(
      onError: (error) {
        showSnackbar(context, error);
        Navigator.of(context).pop();
        print(error);
      },
      onLoading: (loading) {
        showHideLoaderHelper(context, loading);
        print(loading);
      },
      onState: (state) {
        showSucess(context, state);
        Navigator.of(context).pop();
      },
    );
  }

  @override
  void dispose() {
    store.destroy();
    disposer();
    super.dispose();
  }

  Future<Position> getLocation() async {
    final location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return location;
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
                final controller = AlertController();
                try {
                  final id = await controller.getUserId();
                  var coordinations = await getLocation();
                  var dt = DateTime.now();
                  var date = DateFormat("yyyy-MM-dd").format(dt);
                  var hour = DateFormat("HH:mm").format(dt);
                  print(coordinations.latitude);
                  print(coordinations.longitude);
                  print(date);
                  print(hour);
                  print(id);
                  store.sendAlert(
                    AlertParams(
                        userId: id,
                        latitude: coordinations.latitude.toString(),
                        longitude: coordinations.longitude.toString(),
                        date: date,
                        hour: hour),
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
