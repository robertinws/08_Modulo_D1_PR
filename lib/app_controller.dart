import 'package:_08_modulo_d1_pr/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {'/': (context) => HomePage()},
    );
  }
}
