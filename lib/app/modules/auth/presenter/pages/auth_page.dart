import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/input.dart';
import 'package:arretadas/app/core/components/logo_image.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/core/global/models/user_model.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:arretadas/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:arretadas/app/modules/auth/presenter/store/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends ModularState<AuthPage, AuthStore>
    with LoaderMixin, MessagesMixin {
  final AuthStore store = Modular.get();
  final formKey = GlobalKey<FormState>();
  bool obscuredTextPassword = true;
  var user = UserModel();
  late Disposer disposer;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        String dropdownValue = "Qual foi seu herói de infância?";
        final respostaController = TextEditingController();
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                children: [
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
                        //register = register.copyWith(city: dropdownValue);
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
                    controller: respostaController,
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
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: TextCustom(
                  text: 'enviar',
                  fontFamily: 'Exo',
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  print(dropdownValue);
                  print(respostaController.text);
                  /*
                  Navigator.of(context).pop();
                  Modular.to.pushNamed('password');*/
                },
              ),
            ],
          );
        });
      },
    );
  }

  @override
  void initState() {
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
        Modular.to.pushNamedAndRemoveUntil('/menu', ModalRoute.withName('/'));
        print('$state');
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    store.destroy();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LogoImage(),
                  Card(
                    margin: EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Input(
                              label: 'Usuário',
                              hint: 'Digite seu usuário',
                              icon: Icons.person,
                              onSaved: (text) =>
                                  user = user.copyWith(nickname: text),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Esse campo não pode ser vazio.';
                                }
                                if (text.length < 3) {
                                  return 'Use 3 caracteres ou mais. (Possui ${text.length})';
                                }
                              },
                            ),
                            SizedBox(height: 15),
                            Input(
                              label: 'Senha',
                              hint: 'Digite sua senha',
                              onSaved: (text) =>
                                  user = user.copyWith(password: text),
                              icon: Icons.vpn_key,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Esse campo não pode ser vazio.';
                                }
                                if (text.length < 3) {
                                  return 'Use 3 caracteres ou mais. (Possui ${text.length})';
                                }
                              },
                              obscureText: obscuredTextPassword,
                              suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscuredTextPassword =
                                        !obscuredTextPassword;
                                  });
                                },
                                icon: Icon(obscuredTextPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                child: const Text("Esqueci minha senha",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                                onTap: () => _showMyDialog(),
                              ),
                            ),
                            SizedBox(height: 15),
                            Button(
                              width: double.infinity,
                              child: TextCustom(
                                text: 'entrar',
                              ),
                              buttonColor: AppColors.primaryColor,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  store.login(CredentialsParams(
                                      nickname: user.nickname,
                                      password: user.password));
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
