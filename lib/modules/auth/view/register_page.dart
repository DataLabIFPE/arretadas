import 'package:arretadas/modules/auth/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';
import 'package:arretadas/mixins/messages_mixin.dart';
import 'package:arretadas/components/Input.dart';
import 'package:arretadas/components/Button.dart';
import 'package:arretadas/components/Form.dart';
import 'package:arretadas/mixins/loader_mixin.dart';
import 'package:arretadas/modules/splash/view/splash_page.dart';

class RegisterPage extends StatelessWidget {
  static const router = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (context) => RegisterController(),
            child: RegisterContent(),
          ),
        ),
      ),
    );
  }
}

class RegisterContent extends StatefulWidget {
  @override
  _RegisterContentState createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent>
    with LoaderMixin, MessagesMixin {
  final obscurePasswordValueNotifier = ValueNotifier<bool>(true);
  final obscureConfirmPasswordValueNotifier = ValueNotifier<bool>(true);
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final protetionalCode = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = context.read<RegisterController>();
    controller.addListener(() {
      showHideLoaderHelper(context, controller.loading);

      if (!isNull(controller.error)) {
        showError(message: controller.error, context: context);
      }

      if (controller.registerSuccess) {
        showSuccess(
            message: 'Usuário cadastrado com Sucesso', context: context);
        Future.delayed(Duration(seconds: 1), () => Navigator.of(context).pop());
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
              Input(
                color: Colors.white,
                labelText: 'Nome',
                validator: (value) {
                  if (!isLength(value.toString(), 3)) {
                    return 'Nickname deve conter no mínimo 3 caracteres';
                  }
                  return null;
                },
                margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                controller: nameController,
              ),
              ValueListenableBuilder(
                  valueListenable: obscurePasswordValueNotifier,
                  builder: (_, obscurePasswordValueNotifierValue, child) {
                    return Input(
                      color: Colors.white,
                      labelText: 'Senha',
                      margin:
                          EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      type: 'password',
                      suffixIcon: Icon(FontAwesome.eye),
                      suffixIconOnPressed: () {
                        obscurePasswordValueNotifier.value =
                            !obscurePasswordValueNotifierValue;
                      },
                      obscureText: obscurePasswordValueNotifierValue,
                      validator: (value) {
                        if (!isLength(value.toString(), 3)) {
                          return 'Senha deve conter no mínimo 3 caracteres';
                        }
                        return null;
                      },
                      controller: passwordController,
                    );
                  }),
              ValueListenableBuilder(
                  valueListenable: obscureConfirmPasswordValueNotifier,
                  builder:
                      (_, obscureConfirmPasswordValueNotifierValue, child) {
                    return Input(
                      color: Colors.white,
                      labelText: 'Confirme sua senha',
                      margin:
                          EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                      type: 'password',
                      suffixIcon: Icon(FontAwesome.eye),
                      suffixIconOnPressed: () {
                        obscureConfirmPasswordValueNotifier.value =
                            !obscureConfirmPasswordValueNotifierValue;
                      },
                      obscureText: obscureConfirmPasswordValueNotifierValue,
                      validator: (value) {
                        if (!isLength(value.toString(), 3)) {
                          return 'Senha deve conter no mínimo 3 caracteres';
                        } else if (passwordController.text !=
                            value.toString()) {
                          return 'Senha e confirma senha não conferem';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                    );
                  }),
              Input(
                color: Colors.white,
                labelText: 'Código de Proteção (OPCIONAL)',
                margin: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                controller: protetionalCode,
              ),
              Button(
                //btnColor: Colors.white,
                txtColor: Colors.white,
                margin: EdgeInsets.only(top: 30.0),
                child: Text(
                  'CADASTRAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                callback: () {
                  if (formKey.currentState.validate()) {
                    context.read<RegisterController>().registerUser(
                        nameController.text, passwordController.text);
                  }
                },
              ),
              Button(
                btnColor: Colors.white,
                txtColor: Colors.redAccent,
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  'VOLTAR',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                callback: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
