import 'package:flutter/material.dart';

// class InforPage1 extends StatefulWidget {
//   const InforPage1({Kay, key}) : super(key: key);
//   @override
//   _InforPage1State createState() => _InforPage1State();
// }

class InforPage4 extends StatelessWidget {
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
          'assets/Infor_04.png',
          fit: BoxFit.fill,
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
            text: TextSpan(
              text: 'RELACIONAMENTO ABUSIVO.\n\n',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'CUIDADO!\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '• Desrespeitando suas opiniões\n\n'
                        '• Mentindo\n\n'
                        '• Mexendo em suas coisas\n\n'
                        '• Culpando você por tudo\n\n'
                        '• Chamando você de louca\n\n'
                        '• Humilhando você em público\n\n'
                        '• Fazendo chantagem;\n\n'
                        '• Constrangendo/pressionando;\n\n'
                        '• Intimidando/ameaçando;\n\n'
                        '• Controlando/proibindo;\n\n'
                        '• Destruindo suas coisas; \n\n'
                        '• Forçando uma relação sexual; \n\n'
                        '• Batendo;\n\n'
                        '• Prendendo você; \n\n'
                        '• Ameaçando de morte'),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
