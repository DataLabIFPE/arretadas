import 'package:flutter/material.dart';

// class InforPage1 extends StatefulWidget {
//   const InforPage1({Kay, key}) : super(key: key);
//   @override
//   _InforPage1State createState() => _InforPage1State();
// }

class InforPage1 extends StatelessWidget {
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
          'assets/Infor_01.png',
          fit: BoxFit.fill,
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
            text: TextSpan(
              text:
                  'Em SITUAÇÕES DE FUGA, O QUE A MULHER DEVE LEVAR CONSIGO.\n\n',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: 'ATENÇÃO!\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        '1 - Certidão de nascimento e ou carteira de identidade dela e dos filhos;\n\n'
                        '2 - Cartões de seguridade social;\n\n'
                        '3 - Certidão de casamento, carteira de motorista e documento do carro;\n\n'
                        '4 - Número de conta bancária e cartões de crédito;\n\n'
                        '5 - Medicações e receitas;\n\n'
                        '6 - Documentos referentes ao divórcio e outros documentos de possível uso pela justiça;\n\n'
                        '7 - Números de telefones e endereços da família, amigos e de serviços da comunidade;\n\n'
                        '8 - Vestuário e artigos de conforto para ela e para as crianças, chaves de casa e do carro, '
                        'brinquedos favoritos das crianças, para que se sintam mais seguras, livros escolares, objetos de uso pessoal.'),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
