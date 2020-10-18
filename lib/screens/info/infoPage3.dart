import 'package:flutter/material.dart';

// class InforPage1 extends StatefulWidget {
//   const InforPage1({Kay, key}) : super(key: key);
//   @override
//   _InforPage1State createState() => _InforPage1State();
// }

class InforPage3 extends StatelessWidget {
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
          'assets/Infor_03.png',
          fit: BoxFit.fill,
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
            text: TextSpan(
              text: 'CENTRO ESPECIALIZADO DE ATENDIMENTO À MULHER - CEAM\n\n',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'O QUE É?\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:'O Centro Especializado de Atendimento à Mulher – CEAM Joana Beatriz de Lima Silva é um instrumento municipal e gratuito que acolhe, informa, orienta e apoia a mulher em situação de violência doméstica e familiar.\n\n'                   
                    ),
                TextSpan(
                    text: 'O QUE FAZ?\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:'Acolhe a mulher em situação de violência, oferece atendimento e orientações com Advogada, Assistente Social e Psicóloga. Articula e encaminha à Rede de Apoio e Enfrentamento à Violência Doméstica. Além de promover ações educativas, preventivas, que permitam o acesso à cidadania e aos direitos das mulheres. '                   
                    ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
