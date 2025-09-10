import 'package:_08_modulo_d1_pr/global/variaveis.dart';
import 'package:_08_modulo_d1_pr/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueConexao,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.montserrat(),
              bodyLarge: GoogleFonts.montserrat(),
              bodySmall: GoogleFonts.montserrat(),
            ),
          ),
          initialRoute: '/',
          routes: {'/': (context) => HomePage()},
        );
      },
    );
  }
}
