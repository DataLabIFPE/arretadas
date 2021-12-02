import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/input.dart';
import 'package:arretadas/app/core/components/logo_image.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/core/global/models/register_model.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';
import 'package:arretadas/app/modules/register/presenter/store/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>
    with LoaderMixin, MessagesMixin {
  final RegisterStore store = Modular.get();
  final formKey = GlobalKey<FormState>();
  var passwordCache = "";
  var passwordCacheConfirm = "";
  bool obscuredTextPassword = true;
  var register = RegisterModel();
  late Disposer disposer;
  String dropdownValue = 'Monteiro';

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
        showSucess(context, 'Cadastrado com sucesso!');
        Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'));
        print('$state');
      },
    );
    super.initState();
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
                                  register = register.copyWith(nickname: text),
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
                              icon: Icons.vpn_key,
                              onChanged: (text) => passwordCache = text!,
                              onSaved: (text) =>
                                  register = register.copyWith(password: text),
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
                              },
                            ),
                            SizedBox(height: 15),
                            Input(
                              label: 'Confirme sua senha',
                              hint: 'Confirme sua senha',
                              icon: Icons.vpn_key,
                              obscureText: obscuredTextPassword,
                              onChanged: (text) => passwordCacheConfirm = text!,
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
                              },
                            ),
                            SizedBox(height: 15),
                            Input(
                              textInputType: TextInputType.number,
                              label: 'Medida Protetiva (OPCIONAL)',
                              hint: 'Digite sua medida protetiva (OPCIONAL)',
                              onSaved: (text) => register =
                                  register.copyWith(protectionCode: text),
                              validator: (text) {
                                if (text!.isNotEmpty && text.length < 6) {
                                  return 'Medida protetiva precisa de 6 digitos';
                                }
                              },
                            ),
                            SizedBox(height: 15),
                            DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownValue,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.blue,
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                  register =
                                      register.copyWith(city: dropdownValue);
                                });
                              },
                              items: <String>[
                                'Monteiro',
                                'Garanhuns',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 15),
                            Button(
                              width: double.infinity,
                              child: TextCustom(text: 'cadastrar'),
                              buttonColor: AppColors.primaryColor,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  store.cadastrar(RegisterParams(
                                      nickname: register.nickname,
                                      password: register.password,
                                      city: register.city,
                                      roles: register.roles));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
