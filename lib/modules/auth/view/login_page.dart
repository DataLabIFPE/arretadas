import 'package:arretadas/mixins/loader_mixin.dart';
import 'package:flutter/material.dart';
import 'package:arretadas/components/Input.dart';
import 'package:arretadas/components/Button.dart';
import 'package:arretadas/components/Form.dart';
import 'package:arretadas/modules/splash/view/splash_page.dart';
import 'package:arretadas/modules/auth/controller/login_controller.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';
import 'package:arretadas/mixins/messages_mixin.dart';
import 'package:arretadas/screens/menu.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  static const router = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (context) => LoginController(),
            child: LoginContent(),
          ),
        ),
      ),
    );
  }
}

class LoginContent extends StatefulWidget {
  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with LoaderMixin, MessagesMixin {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePasswordValueNotifier = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    final loginController = context.read<LoginController>();
    loginController.addListener(() {
      showHideLoaderHelper(context, loginController.showLoader);

      if (!isNull(loginController.error)) {
        showError(message: loginController.error, context: context);
      }

      if (loginController.loginSuccess) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(SplashPage.router, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/Background.jpg',
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/logo-white.png'),
                      ),
                    ],
                  ),
                ],
              ),
              CustomForm(
                fields: <Widget>[
                  Input(
                      margin:
                          EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0),
                      controller: nameController,
                      type: 'username',
                      validator: (value) {
                        if (!isLength(value.toString(), 3)) {
                          return 'Nickname deve conter no mínimo 3 caracteres';
                        }
                        return null;
                      },
                      color: Colors.white,
                      labelText: 'Nickname')
                ],
              ),
              CustomForm(
                fields: <Widget>[
                  ValueListenableBuilder(
                    valueListenable: obscurePasswordValueNotifier,
                    builder: (_, obscurePasswordValueNotifierValue, child) {
                      return Input(
                          margin: EdgeInsets.only(
                              top: 20.0, left: 10.0, right: 10.0),
                          controller: passwordController,
                          suffixIcon: Icon(FontAwesome.eye),
                          suffixIconOnPressed: () {
                            obscurePasswordValueNotifier.value =
                                !obscurePasswordValueNotifierValue;
                          },
                          type: 'password',
                          obscureText: obscurePasswordValueNotifierValue,
                          validator: (value) {
                            if (!isLength(value.toString(), 3)) {
                              return 'Senha deve conter no mínimo 3 caracteres';
                            }
                            return null;
                          },
                          color: Colors.white,
                          labelText: 'Senha');
                    },
                  )
                ],
              ),
              Button(
                txtColor: Colors.redAccent,
                btnColor: Colors.white,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Text(
                  'ENTRAR',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                callback: () {
                  if (formKey.currentState.validate()) {
                    context.read<LoginController>().login(
                          nameController.text,
                          passwordController.text,
                        );
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
