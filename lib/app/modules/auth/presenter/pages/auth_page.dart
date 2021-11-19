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
