import 'package:arretadas/app/core/components/input.dart';
import 'package:arretadas/app/core/components/logo_image.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:arretadas/app/modules/recovery/domain/usecases/recovery_questions_usecase.dart';
import 'package:arretadas/app/modules/recovery/presenter/store/recovery_questions_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class RecoveryQuestionsPage extends StatefulWidget {
  const RecoveryQuestionsPage({Key? key}) : super(key: key);

  @override
  State<RecoveryQuestionsPage> createState() => _RecoveryQuestionsPageState();
}

class _RecoveryQuestionsPageState
    extends ModularState<RecoveryQuestionsPage, RecoveryQuestionsStore>
    with LoaderMixin, MessagesMixin {
  @override
  final RecoveryQuestionsStore store = Modular.get();
  late Disposer disposer;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    disposer = store.observer(
      onError: (error) {
        showSnackbar(context, error);
        print(error);
      },
      onLoading: (loading) {
        showHideLoaderHelper(context, loading);
        print(loading);
      },
      onState: (state) {
        Modular.to.pushReplacementNamed('recoverPassword', arguments: state.id);
        print('$state');
      },
    );
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          String dropdownValue = "Qual foi seu herói de infância?";
          var indexQuestion = 1;
          final respostaController = TextEditingController();
          final usuarioController = TextEditingController();
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: StatefulBuilder(builder: (context, setState) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Form(
                  key: formKey,
                  child: AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Informe o usuário'.toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Input(
                            label: 'Usuário',
                            controller: usuarioController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Informe o usuário.';
                              }
                              if (value.length < 3) {
                                return 'Nickname inválido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Informe a pergunta de segurança'.toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            value: dropdownValue,
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.red,
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                if (newValue ==
                                    "Qual foi seu herói de infância?") {
                                  indexQuestion = 1;
                                } else if (newValue ==
                                    "Qual o nome do seu primo favorito?") {
                                  indexQuestion = 2;
                                } else if (newValue ==
                                    "Onde o seu pai e sua mãe se conheceram?") {
                                  indexQuestion = 3;
                                } else if (newValue ==
                                    "Qual era o nome do seu primeiro animal de estimação?") {
                                  indexQuestion = 4;
                                } else if (newValue ==
                                    "Qual era o nome do seu melhor amigo na adolescência?") {
                                  indexQuestion = 5;
                                }
                              });
                            },
                            items: <String>[
                              'Qual foi seu herói de infância?',
                              'Qual o nome do seu primo favorito?',
                              'Onde o seu pai e sua mãe se conheceram?',
                              'Qual era o nome do seu primeiro animal de estimação?',
                              'Qual era o nome do seu melhor amigo na adolescência?',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Escolha a resposta'.toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Input(
                            label: 'Resposta',
                            controller: respostaController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Informe a resposta.';
                              }
                              if (value.length < 3) {
                                return 'Resposta inválida';
                              }
                              return null;
                            },
                          ),
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
                          Modular.to.pop();
                          Modular.to.pop();
                        },
                      ),
                      TextButton(
                        child: TextCustom(
                          text: 'enviar',
                          fontFamily: 'Exo',
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            print(dropdownValue);
                            print(indexQuestion);
                            print(respostaController.text);
                            print(usuarioController.text);
                            store.recovery(RecoveryQuestionsParams(
                                nickname: usuarioController.text,
                                indexQuestion: indexQuestion,
                                answerQuestion: respostaController.text));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    store.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              LogoImage(),
            ],
          ),
        ),
      ),
    );
  }
}
