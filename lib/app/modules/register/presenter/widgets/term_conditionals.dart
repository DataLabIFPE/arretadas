import 'package:arretadas/app/modules/register/presenter/controller/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/text_custom.dart';

class TermConditionalsWidget extends StatefulWidget {
  const TermConditionalsWidget({Key? key}) : super(key: key);

  @override
  State<TermConditionalsWidget> createState() => _TermConditionalsWidgetState();
}

class _TermConditionalsWidgetState extends State<TermConditionalsWidget> {
  late RegisterController controller;

  @override
  Widget build(BuildContext context) {
    controller = context.watch();
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Eu li e aceito os ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'TERMOS E CONDIÇÕES',
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Termos e Condições',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        TextButton(
                          child: TextCustom(
                            text: 'RECUSAR',
                            fontFamily: 'Exo',
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        TextButton(
                          child: TextCustom(
                            text: 'ACEITAR',
                            fontFamily: 'Exo',
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                ).then((value) {
                  setState(() {
                    controller.changeAcceptTerms(value);
                  });
                });
              },
          ),
        ],
      ),
    );
  }
}
