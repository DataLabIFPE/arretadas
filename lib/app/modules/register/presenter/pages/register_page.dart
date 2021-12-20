import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/core/global/models/register_model.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:arretadas/app/modules/register/presenter/store/register_store.dart';
import 'package:arretadas/app/modules/register/presenter/widgets/formulario.dart';
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
  int currentStep = 0;

  @override
  void initState() {
    register = register.copyWith(city: dropdownValue);
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
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Image.asset(
                      "assets/icons/icon_white_shadow.png",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: SizedBox(
                        height: 480,
                        child: Formulario(),
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
