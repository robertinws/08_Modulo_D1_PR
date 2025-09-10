import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavComp extends StatelessWidget {
  BottomNavComp({required this.contexto, super.key});
  BuildContext contexto;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: ModalRoute.of(contexto)!.settings.name == '/'
                  ? null
                  : () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
              child: Image.asset(
                height: 50,
                'assets/images/cursos.png',
                fit: BoxFit.cover,
              ),
            ),
            InkWell(
              onTap:
                  ModalRoute.of(contexto)!.settings.name == '/profs'
                  ? null
                  : () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed('/profs');
                    },
              child: Image.asset(
                height: 50,
                'assets/images/profs.png',
                fit: BoxFit.cover,
              ),
            ),
            InkWell(
              onTap:
                  ModalRoute.of(contexto)!.settings.name ==
                      '/relatorios'
                  ? null
                  : () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed('/relatorios');
                    },
              child: Image.asset(
                height: 50,
                'assets/images/relatorios.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
