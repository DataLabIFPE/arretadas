import 'package:arretadas/app/modules/menu/dialogs/policy_dialog.dart';
import 'package:arretadas/app/modules/register/presenter/controller/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  builder: (context) {
                    return PolicyDialog(mdFileName: 'privacy_policy.md');
                  },
                );
              },
          ),
        ],
      ),
    );
  }
}
