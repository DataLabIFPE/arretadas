import 'package:arretadas/app/modules/info/domain/entities/info.dart';
import 'package:arretadas/app/modules/info/domain/entities/info_details.dart';
import 'package:arretadas/app/modules/info/infra/datasources/info_datasource.dart';

class InfoDatasorceImpl implements InfoDatasource {
  @override
  Future<List<Info>?> getInfos() async {
    final List<Info> infos = [
      Info(
        image: 'assets/images/info_01.png',
        title: 'Situações de Fuga',
        details: [
          InfoDetails(
            description:
                'EM SITUAÇÕES DE FUGA, O QUE A MULHER DEVE LEVAR CONSIGO.',
          ),
          InfoDetails(
            leading: '1',
            description:
                'Certidão de nascimento e ou carteira de identidade dela e dos filhos',
          ),
          InfoDetails(
            leading: '2',
            description: 'Cartões de seguridade social',
          ),
          InfoDetails(
            leading: '3',
            description:
                'Certidão de casamento, carteira de motorista e documento do carro',
          ),
          InfoDetails(
            leading: '4',
            description: 'Número de conta bancária e cartões de crédito',
          ),
          InfoDetails(
            leading: '5',
            description: 'Medicações e receitas',
          ),
          InfoDetails(
            leading: '6',
            description:
                'Documentos referentes ao divórcio e outros documentos de possível uso pela justiça',
          ),
          InfoDetails(
            leading: '7',
            description:
                'Números de telefones e endereços da família, amigos e de serviços da comunidade',
          ),
          InfoDetails(
            leading: '8',
            description:
                'Vestuário e artigos de conforto para ela e para as crianças, chaves de casa e do carro, brinquedos favoritos das crianças, para que se sintam mais seguras, livros escolares, objetos de uso pessoal',
          ),
        ],
      ),
      Info(
        image: 'assets/images/info_02.png',
        title: 'Direitos Reprodutivos e Sexuais',
        details: [
          InfoDetails(
            description:
                'QUANDO OS DIREITOS REPRODUTIVOS E SEXUAIS DA MULHER É VIOLADO?',
          ),
          InfoDetails(
            leading: '1',
            description: 'Obrigar a mulher a engravidar ou abortar',
          ),
          InfoDetails(
            leading: '2',
            description: 'Impedir que a mulher procure uma unidade de saúde',
          ),
          InfoDetails(
            leading: '3',
            description:
                'Impedir que a mulher realize exames e procedimentos médico/ginecológico',
          ),
          InfoDetails(
            leading: '4',
            description:
                'Impedir a mulher de utilizar métodos contraceptivos: Pílula anticoncepcional, Preservativos, Diu',
          ),
          InfoDetails(
            leading: '5',
            description:
                'Impedir que a mulher tenha acesso ao planejamento familiar',
          ),
          InfoDetails(
            leading: '6',
            description:
                'Obrigar a mulher a manter relações sexuais quando não deseja',
          ),
          InfoDetails(
            leading: '7',
            description:
                'Retirar o preservativo sem o consentimento da Mulher durante a relação sexual',
          ),
        ],
      ),
      Info(
        image: 'assets/images/info_03.png',
        title: 'Centro Especializado em Atendimento à Mulher',
        details: [
          InfoDetails(description: 'O QUE É?'),
          InfoDetails(
            leading: '•',
            description:
                'O Centro Especializado de Atendimento à Mulher – CEAM Joana Beatriz de Lima Silva é um instrumento municipal e gratuito que acolhe, informa, orienta e apoia a mulher em situação de violência doméstica e familiar.',
          ),
          InfoDetails(description: 'O QUE FAZ?'),
          InfoDetails(
            leading: '•',
            description:
                'Acolhe a mulher em situação de violência, oferece atendimento e orientações com Advogada, Assistente Social e Psicóloga. Articula e encaminha à Rede de Apoio e Enfrentamento à Violência Doméstica. Além de promover ações educativas, preventivas, que permitam o acesso à cidadania e aos direitos das mulheres.',
          ),
        ],
      ),
      Info(
        image: 'assets/images/info_04.png',
        title: 'Relacionamento Abusivo',
        details: [
          InfoDetails(
            description: 'COMO SABER SE ESTOU EM UM RELACIONAMENTO ABUSIVO?',
          ),
          InfoDetails(
              description: 'Desrespeitando suas opiniões', leading: '•'),
          InfoDetails(description: 'Mentindo', leading: '•'),
          InfoDetails(description: 'Mexendo em suas coisas', leading: '•'),
          InfoDetails(description: 'Culpando você por tudo', leading: '•'),
          InfoDetails(description: 'Chamando você de louca', leading: '•'),
          InfoDetails(description: 'Humilhando você em público', leading: '•'),
          InfoDetails(description: 'Fazendo chantagem', leading: '•'),
          InfoDetails(description: 'Constrangendo/pressionando', leading: '•'),
          InfoDetails(description: 'Intimidando/ameaçando', leading: '•'),
          InfoDetails(description: 'Controlando/proibindo', leading: '•'),
          InfoDetails(description: 'Destruindo suas coisas', leading: '•'),
          InfoDetails(description: 'Forçando uma relação sexual', leading: '•'),
          InfoDetails(description: 'Batendo', leading: '•'),
          InfoDetails(description: 'Prendendo você', leading: '•'),
          InfoDetails(description: 'Ameaçando de morte', leading: '•'),
        ],
      ),
      Info(
        image: 'assets/images/info_05.png',
        title: 'Maria da Penha',
        details: [
          InfoDetails(description: 'LEI MARIA DA PENHA'),
          InfoDetails(
            leading: 'Art. 1º',
            description:
                'Esta Lei cria mecanismos para coibir e prevenir a violência doméstica e familiar contra a mulher, nos termos do § 8º do art. 226 da Constituição Federal, da Convenção sobre a Eliminação de Todas as Formas de Violência contra a Mulher, da Convenção Interamericana para Prevenir, Punir e Erradicar a Violência contra a Mulher e de outros tratados internacionais ratificados pela República Federativa do Brasil; dispõe sobre a criação dos Juizados de Violência Doméstica e Familiar contra a Mulher; e estabelece medidas de assistência e proteção às mulheres em situação de violência doméstica e familiar.',
          ),
          InfoDetails(
            leading: 'Art. 2º',
            description:
                'Toda mulher, independentemente de classe, raça, etnia, orientação sexual, renda, cultura, nível educacional, idade e religião, goza dos direitos fundamentais inerentes à pessoa humana, sendo-lhe asseguradas as oportunidades e facilidades para viver sem violência, preservar sua saúde física e mental e seu aperfeiçoamento moral, intelectual e social.',
          ),
          InfoDetails(
            leading: 'Art. 3º',
            description:
                'Serão asseguradas às mulheres as condições para o exercício efetivo dos direitos à vida, à segurança, à saúde, à alimentação, à educação, à cultura, à moradia, ao acesso à justiça, ao esporte, ao lazer, ao trabalho, à cidadania, à liberdade, à dignidade, ao respeito e à convivência familiar e comunitária.',
          ),
          InfoDetails(
            leading: 'Art. 4º',
            description:
                'Na interpretação desta Lei, serão considerados os fins sociais a que ela se destina e, especialmente, as condições peculiares das mulheres em situação de violência doméstica e familiar.',
          ),
        ],
      ),
    ];
    return infos;
  }
}
