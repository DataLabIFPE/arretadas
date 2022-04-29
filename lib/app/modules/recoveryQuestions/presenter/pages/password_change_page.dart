import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/input.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    print(widget.id);
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
                        height: 300,
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
                                  /*onSaved: (text) =>,
                                      user = user.copyWith(nickname: text),*/
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
                                SizedBox(height: 15),
                                Input(
                                  label: 'Senha',
                                  hint: 'Digite sua senha',
                                  /*onSaved: (text) =>
                                      user = user.copyWith(password: text),*/
                                  icon: Icons.vpn_key,
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
                                  onPressed: () {},
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
