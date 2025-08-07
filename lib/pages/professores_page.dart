import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modulo_d1_pr/global/colors.dart';
import 'package:modulo_d1_pr/global/variaveis.dart';

class ProfessoresPage extends StatefulWidget {
  const ProfessoresPage({super.key});

  @override
  State<ProfessoresPage> createState() => _ProfessoresPageState();
}

class _ProfessoresPageState extends State<ProfessoresPage> {
  List<dynamic> listProfessores = [];
  int indexPressionado = -1;

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    listProfessores = jsonDecode(jsonList)['professores_id'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corClara,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Professores'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          icon: Icon(Icons.home),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(color: corClara),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Busca',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: corEscuro),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: listProfessores.length,
                  itemBuilder: (context, index) {
                    final professor = listProfessores[index];
                    return Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        vertical: 10,
                      ),
                      child: GestureDetector(
                        onLongPress: () {
                          setState(() {
                            indexPressionado = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: corClara,
                            border: Border.all(
                              width: 1,
                              color: corEscuro,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Text(
                                      '${professor['nome']}\n${professor['descricao']}',
                                      style: TextStyle(
                                        color: corEscuro,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  indexPressionado == index
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete),
                                        )
                                      : Container(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(
            context,
          ).pushReplacementNamed('/cadastroProfessor');
        },
        style: IconButton.styleFrom(
          backgroundColor: corRoxoMedio,
          foregroundColor: corClara,
        ),
        icon: Icon(Icons.add),
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
              Image.asset(
                height: 40,
                'assets/images/profs.png',
                fit: BoxFit.cover,
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
