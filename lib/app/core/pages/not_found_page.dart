import 'package:arretadas/app/core/components/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            child: const LogoImage(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.46,
            child: Text(
              'OOPS!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                      color: Colors.black26.withOpacity(1),
                      offset: const Offset(0, 0),
                      blurRadius: 6),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.52,
            child: Text(
              'Página não encontrada.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: [
                  Shadow(
                      color: Colors.black26.withOpacity(1),
                      offset: const Offset(0, 0),
                      blurRadius: 6),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            child: SizedBox(
              height: 50.0,
              width: (MediaQuery.of(context).size.width * 0.55),
              child: ElevatedButton(
                child: const Text('PÁGINA INICIAL'),
                onPressed: () {
                  Modular.to.navigate('/');
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 10,
                  primary: Colors.white,
                  onPrimary: const Color(0xFFFF4F4D),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
