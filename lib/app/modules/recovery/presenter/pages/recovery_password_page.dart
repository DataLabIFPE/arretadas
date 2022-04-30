import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/input.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:arretadas/app/modules/recovery/presenter/store/recovery_password_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/usecases/recovery_password_usecase.dart';

class PasswordChangePage extends StatefulWidget {
  final String id;

  const PasswordChangePage({Key? key, required this.id}) : super(key: key);

  @override
  _PasswordChangePageState createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage>
    with LoaderMixin, MessagesMixin {
  final formKey = GlobalKey<FormState>();

  bool obscuredTextPassword = true;
  final controller = TextEditingController();
  final RecoveryPasswordStore store = Modular.get();
  late Disposer disposer;

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
        //Modular.to.pushNamedAndRemoveUntil('/menu', ModalRoute.withName('/'));
        showSucess(context, 'Senha alterada com sucesso!');
        Modular.to.pop();
        print('$state');
      },
    );
  }

  @override
  void dispose() {
    store.destroy();
    disposer();
    super.dispose();
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Input(
                                  label: 'Nova senha',
                                  hint: 'Digite sua nova senha',
                                  icon: Icons.vpn_key,
                                  controller: controller,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Esse campo não pode ser vazio.';
                                    }
                                    if (text.length < 3) {
                                      return 'Use 3 caracteres ou mais. (Possui ${text.length})';
                                    }
                                    return null;
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
                                    text: 'alterar senha',
                                  ),
                                  buttonColor: AppColors.primaryColor,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      store.recovery(RecoveryPasswordParams(
                                          id: widget.id,
                                          newPassword: controller.text));
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
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
