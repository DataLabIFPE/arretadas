import 'package:flutter/material.dart';

// class InforPage1 extends StatefulWidget {
//   const InforPage1({Kay, key}) : super(key: key);
//   @override
//   _InforPage1State createState() => _InforPage1State();
// }

class InforPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: InfoPageContent(),
      )),
    );
  }
}

class InfoPageContent extends StatefulWidget {
  @override
  _InforPage1State createState() => _InforPage1State();
}

class _InforPage1State extends State<InfoPageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/Infor_02.png',
          fit: BoxFit.fill,
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
            text: TextSpan(
              text: 'QUANDO OS DIREITOS REPRODUTIVOS E SEXUAIS DA MULHER É VIOLADO?\n\n',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'ATENÇÃO!\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:'• Obrigar a mulher a engravidar ou abortar;\n\n'
                        '• Impedir que a mulher procure uma unidade de saúde;\n\n'
                        '• Impedir que a mulher realize exames e procedimentos médico/ginecológico;\n\n'
                        '• Impedir a mulher de utilizar métodos contraceptivos: Pílula anticoncepcional, Preservativos, Diu;\n\n'
                        '• Impedir que a mulher tenha acesso ao planejamento familiar;\n\n'
                        '• Obrigar a mulher a manter relações sexuais quando não deseja;\n\n'
                        '• Retirar o preservativo sem o consentimento da Mulher durante a relação sexual.' 
                        ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
