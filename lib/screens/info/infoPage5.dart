//import 'package:arretadas/components/Button.dart';
import 'package:flutter/material.dart';

// class InforPage1 extends StatefulWidget {
//   const InforPage1({Kay, key}) : super(key: key);
//   @override
//   _InforPage1State createState() => _InforPage1State();
// }

class InforPage5 extends StatelessWidget {
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
              text: 'LEI - MARIA DA PENA.\n\n',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: '!\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Art. 1º Esta Lei cria mecanismos para coibir e prevenir a violência doméstica e familiar contra a mulher, nos termos do § 8º do art. 226 da Constituição Federal, da Convenção sobre a Eliminação de Todas as Formas de Violência contra a Mulher, da Convenção Interamericana para Prevenir, Punir e Erradicar a Violência contra a Mulher e de outros tratados internacionais ratificados pela República Federativa do Brasil; dispõe sobre a criação dos Juizados de Violência Doméstica e Familiar contra a Mulher; e estabelece medidas de assistência e proteção às mulheres em situação de violência doméstica e familiar.\n\n'
                        'Art. 2º Toda mulher, independentemente de classe, raça, etnia, orientação sexual, renda, cultura, nível educacional, idade e religião, goza dos direitos fundamentais inerentes à pessoa humana, sendo-lhe asseguradas as oportunidades e facilidades para viver sem violência, preservar sua saúde física e mental e seu aperfeiçoamento moral, intelectual e social.\n\n'
                        'Art. 3º Serão asseguradas às mulheres as condições para o exercício efetivo dos direitos à vida, à segurança, à saúde, à alimentação, à educação, à cultura, à moradia, ao acesso à justiça, ao esporte, ao lazer, ao trabalho, à cidadania, à liberdade, à dignidade, ao respeito e à convivência familiar e comunitária.\n\n'
                        '§ 1º O poder público desenvolverá políticas que visem garantir os direitos humanos das mulheres no âmbito das relações domésticas e familiares no sentido de resguardá-las de toda forma de negligência, discriminação, exploração, violência, crueldade e opressão.\n\n'
                        '§ 2º Cabe à família, à sociedade e ao poder público criar as condições necessárias para o efetivo exercício dos direitos enunciados no caput.\n\n'
                        'Art. 4º Na interpretação desta Lei, serão considerados os fins sociais a que ela se destina e, especialmente, as condições peculiares das mulheres em situação de violência doméstica e familiar.'),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
