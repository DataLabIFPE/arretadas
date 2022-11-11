import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/input.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:arretadas/app/modules/change_password/presenter/controller/change_password_controller.dart';
import 'package:arretadas/app/modules/change_password/presenter/store/change_password_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/usecases/change_password_usecase.dart';

class ChangePasswordPage extends StatefulWidget {
  final String id;
  final String nickname;

  const ChangePasswordPage({Key? key, required this.id, required this.nickname})
      : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage>
    with LoaderMixin, MessagesMixin {
  final formKey = GlobalKey<FormState>();

  bool obscuredTextCurrentPassword = true;
  bool obscuredTextNewPassword = true;
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final ChangePasswordStore store = Modular.get();
  late Disposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = store.observer(
      onError: (error) {
        FocusScope.of(context).requestFocus(FocusNode());
        showSnackbar(context, error);
        print(error);
      },
      onLoading: (loading) {
        showHideLoaderHelper(context, loading);
        print(loading);
      },
      onState: (state) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        showSucess(context, 'Senha alterada com sucesso!');
        print(state);
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
                      child: SizedBox(
                        height: 272.0,
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Input(
                                  label: 'Senha atual',
                                  hint: 'Digite sua senha atual',
                                  icon: Icons.vpn_key,
                                  controller: currentPasswordController,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Esse campo não pode ser vazio.';
                                    }
                                    if (text.length < 3) {
                                      return 'Use 3 caracteres ou mais. (Possui ${text.length})';
                                    }
                                    return null;
                                  },
                                  obscureText: obscuredTextCurrentPassword,
                                  suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscuredTextCurrentPassword =
                                            !obscuredTextCurrentPassword;
                                      });
                                    },
                                    icon: Icon(obscuredTextCurrentPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Input(
                                  label: 'Nova senha',
                                  hint: 'Digite sua nova senha',
                                  icon: Icons.vpn_key,
                                  controller: newPasswordController,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Esse campo não pode ser vazio.';
                                    }
                                    if (text.length < 3) {
                                      return 'Use 3 caracteres ou mais. (Possui ${text.length})';
                                    }
                                    return null;
                                  },
                                  obscureText: obscuredTextNewPassword,
                                  suffix: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscuredTextNewPassword =
                                            !obscuredTextNewPassword;
                                      });
                                    },
                                    icon: Icon(obscuredTextNewPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Button(
                                        width: double.infinity,
                                        child: const TextCustom(
                                          text: 'Cancelar',
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        buttonColor: Colors.grey,
                                      ),
                                    ),
                                    Expanded(
                                      child: Button(
                                        width: double.infinity,
                                        child: const TextCustom(
                                          text: 'alterar senha',
                                        ),
                                        buttonColor: AppColors.primaryColor,
                                        onPressed: () async {
                                          final controller =
                                              ChangePasswordController();
                                          if (formKey.currentState!
                                              .validate()) {
                                            formKey.currentState!.save();
                                            try {
                                              final token =
                                                  await controller.getToken();
                                              store.change(
                                                ChangePasswordParams(
                                                    token: token,
                                                    nickname: widget.nickname,
                                                    oldPassword:
                                                        currentPasswordController
                                                            .text,
                                                    id: widget.id,
                                                    newPassword:
                                                        newPasswordController
                                                            .text),
                                              );
                                            } on Exception catch (e) {
                                              print(e.toString());
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
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
