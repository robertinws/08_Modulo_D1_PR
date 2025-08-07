import 'package:flutter/material.dart';
import 'package:modulo_d1_pr/pages/cadastro_curso_page.dart';
import 'package:modulo_d1_pr/pages/cadastro_professor_page.dart';
import 'package:modulo_d1_pr/pages/home_page.dart';
import 'package:modulo_d1_pr/pages/professores_page.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/cadastroCurso': (context) => CadastroCursoPage(),
        '/professores': (context) => ProfessoresPage(),
        '/cadastroProfessor': (context) => CadastroProfessorPage(),
      },
    );
  }
}
