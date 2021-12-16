import 'package:arretadas/app/core/components/input.dart';
import 'package:arretadas/app/core/components/logo_image.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/core/mixins/loader_mixin.dart';
import 'package:arretadas/app/core/mixins/messages_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({Key? key}) : super(key: key);

  @override
  _PasswordChangePageState createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage>
    with LoaderMixin, MessagesMixin {
  final formKey = GlobalKey<FormState>();
  var passwordCache = "";
  var passwordCacheConfirm = "";
  bool obscuredTextPassword = true;

  late Disposer disposer;
  String dropdownValue = 'Monteiro';
  int currentStep = 0;

  @override
  void initState() {
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
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
