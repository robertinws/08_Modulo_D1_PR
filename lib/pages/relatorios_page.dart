import 'package:_08_modulo_d1_pr/components/bottom_nav_comp.dart';
import 'package:_08_modulo_d1_pr/global/colors.dart';
import 'package:flutter/material.dart';

class RelatoriosPage extends StatefulWidget {
  const RelatoriosPage({super.key});

  @override
  State<RelatoriosPage> createState() => _RelatoriosPageState();
}

class _RelatoriosPageState extends State<RelatoriosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corClara,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Relatórios'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/', (context) => false);
          },
          icon: Icon(Icons.home, size: 40),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: null,
        icon: Icon(Icons.save),
      ),
      bottomNavigationBar: BottomNavComp(contexto: context),
    );
  }
}
