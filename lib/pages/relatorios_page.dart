import 'package:flutter/material.dart';
import 'package:modulo_d1_pr/global/colors.dart';

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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          icon: Icon(Icons.home),
        ),
        title: Text('Relatórios'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 10,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text('Curso'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: corEscuro),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text('Professor'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: corEscuro),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: corRoxoMedio,
                  foregroundColor: corClara,
                ),
                child: Text('Gerar Relatório'),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: corClara,
                    border: Border.all(width: 1, color: corEscuro),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: null,
        style: IconButton.styleFrom(
          backgroundColor: corRoxoMedio,
          foregroundColor: corClara,
        ),
        icon: Icon(Icons.save),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 20,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Image.asset(
                  height: 40,
                  'assets/images/cursos.png',
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed('/professores');
                },
                child: Image.asset(
                  height: 40,
                  'assets/images/profs.png',
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  height: 40,
                  'assets/images/relatorios.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
