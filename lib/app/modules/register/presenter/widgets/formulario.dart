import 'package:arretadas/app/core/components/input.dart';
import 'package:arretadas/app/core/global/models/register_model.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';
import 'package:arretadas/app/modules/register/presenter/store/register_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario>
    with LoaderMixin, MessagesMixin {
  int currentStep = 0;
  bool obscuredTextPassword = true;
  String questionValue = "Qual foi seu herói de infância?";
  String cityValue = "Garanhuns";
  var register = RegisterModel();
  final RegisterStore store = Modular.get();
  final formKey = GlobalKey<FormState>();
  var passwordCache = "";
  var passwordCacheConfirm = "";
  late Disposer disposer;
  var indexQuestion = 1;

  @override
  void initState() {
    super.initState();
    register = register.copyWith(city: cityValue);
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
        showSucess(context, 'Cadastrado com sucesso!');
        Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'));
        print('$state');
      },
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text('Credênciais'),
        content: Form(
          key: formKey,
          child: Column(
            children: [
              Input(
                label: 'Usuário',
                hint: 'Digite seu usuário',
                icon: Icons.person,
                onSaved: (text) => register = register.copyWith(nickname: text),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Esse campo não pode ser vazio.';
                  }
                  if (text.length < 3) {
                    return 'Use 3 caracteres ou mais. (Possui ${text.length})';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Input(
                label: 'Senha',
                hint: 'Digite sua senha',
                icon: Icons.vpn_key,
                obscureText: obscuredTextPassword,
                onChanged: (text) => passwordCache = text!,
                onSaved: (text) => register = register.copyWith(password: text),
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      obscuredTextPassword = !obscuredTextPassword;
                    });
                  },
                  icon: Icon(obscuredTextPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Esse campo não pode ser vazio.';
                  }
                  if (text.length < 6) {
                    return 'Use 6 caracteres ou mais. (Possui ${text.length})';
                  }
                  if (passwordCacheConfirm != passwordCache) {
                    return 'As senhas não são iguais.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Input(
                label: 'Confirme sua senha',
                hint: 'Confirme sua senha',
                icon: Icons.vpn_key,
                obscureText: obscuredTextPassword,
                onChanged: (text) => passwordCacheConfirm = text!,
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      obscuredTextPassword = !obscuredTextPassword;
                    });
                  },
                  icon: Icon(obscuredTextPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Esse campo não pode ser vazio.';
                  }
                  if (text.length < 6) {
                    return 'Use 6 caracteres ou mais. (Possui ${text.length})';
                  }
                  if (passwordCacheConfirm != passwordCache) {
                    return 'As senhas não são iguais.';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Input(
                textInputType: TextInputType.text,
                label: 'Medida Protetiva (OPCIONAL)',
                hint: 'Digite sua medida protetiva',
                maxLength: 6,
                onSaved: (text) =>
                    register = register.copyWith(protectionCode: text),
                validator: (text) {
                  if (text!.isNotEmpty && text.length < 6) {
                    return 'Medida protetiva precisa de 6 digitos';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text('Segurança'),
        content: Column(
          children: [
            Text(
              'Escolha a pergunta de segurança'.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: questionValue,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: (newValue) {
                setState(() {
                  questionValue = newValue!;
                  if (newValue == "Qual foi seu herói de infância?") {
                    indexQuestion = 1;
                  } else if (newValue == "Qual o nome do seu primo favorito?") {
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
                  register = register.copyWith(indexQuestion: indexQuestion);
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
              height: 20,
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
              onChanged: (text) {
                register = register.copyWith(answerQuestion: text);
              },
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text('Cidade'),
        content: Column(
          children: [
            Text(
              'Escolha sua cidade '.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: cityValue,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: (newValue) {
                setState(() {
                  cityValue = newValue!;
                  register = register.copyWith(city: cityValue);
                });
              },
              items: <String>[
                'Garanhuns',
                'Monteiro',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      steps: getSteps(),
      currentStep: currentStep,
      onStepContinue: () {
        final isLastStep = currentStep == getSteps().length - 1;
        formKey.currentState?.save();
        final isValid = register.nickname.isNotEmpty &&
            register.password.isNotEmpty &&
            register.indexQuestion != 0 &&
            register.answerQuestion.isNotEmpty &&
            register.city.isNotEmpty;
        if (isLastStep && isValid) {
          final params = RegisterParams(
            nickname: register.nickname,
            password: register.password,
            protectionCode: register.protectionCode,
            indexQuestion: register.indexQuestion,
            answerQuestion: register.answerQuestion,
            city: register.city,
            roles: register.roles,
          );
          store.cadastrar(params);
        } else if (isLastStep) {
          showSnackbar(context, 'Campos inválidos. Preencha corretamente!');
        } else {
          setState(() {
            currentStep += 1;
          });
        }
      },
      onStepTapped: (value) {
        setState(() {
          currentStep = value;
        });
      },
      onStepCancel: currentStep == 0
          ? null
          : () {
              setState(
                () {
                  currentStep -= 1;
                },
              );
            },
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        final isLastStep = currentStep == getSteps().length - 1;
        return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Text(isLastStep ? 'ENVIAR' : 'CONTINUAR'),
                  onPressed: details.onStepContinue,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              if (currentStep != 0)
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      primary: Colors.grey,
                    ),
                    child: const Text('VOLTAR'),
                    onPressed: details.onStepCancel,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
