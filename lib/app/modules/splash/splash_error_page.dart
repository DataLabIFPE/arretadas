import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/constants/app_colors.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/messages_mixin.dart';

class SplashErrorPage extends StatefulWidget {
  const SplashErrorPage({Key? key}) : super(key: key);

  @override
  State<SplashErrorPage> createState() => _SplashErrorPageState();
}

class _SplashErrorPageState extends State<SplashErrorPage>
    with LoaderMixin, MessagesMixin {
  final SplashStore store = Modular.get();
  late bool isButtonDisabled = false;
  @override
  void initState() {
    super.initState();
    store.observer(
      onState: (state) {
        print(state);
        Modular.to.pushReplacementNamed('/');
      },
      onLoading: (loading) {
        showHideLoaderHelper(context, loading);
        print(loading);
      },
      onError: (error) {
        showSnackbar(context, error.message.characters);
      },
    );
  }

  @override
  void dispose() {
    store.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Image.asset("assets/icons/icon_white.png"),
            ),
            Button(
              buttonColor: AppColors.primaryColorAccent,
              onPressed: isButtonDisabled
                  ? null
                  : () {
                      setState(() {
                        isButtonDisabled = true;

                        store.checkAuth();

                        isButtonDisabled = false;
                      });
                    },
              child: const Center(
                  child: TextCustom(
                text: 'Tente novamente',
                color: AppColors.primaryColor,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
