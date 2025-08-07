import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modulo_d1_pr/global/colors.dart';
import 'package:modulo_d1_pr/global/variaveis.dart';

class CadastroCursoPage extends StatefulWidget {
  const CadastroCursoPage({super.key});

  @override
  State<CadastroCursoPage> createState() => _CadastroCursoPageState();
}

class _CadastroCursoPageState extends State<CadastroCursoPage> {
  bool visivel = false;
  int categoriaSelecionada = 0;
  List<dynamic> listCategorias = [];
  List<dynamic> listProfessoresAdd = [];
  List<dynamic> listProfessores = [];
  List<DropdownMenuItem> listDrops = [];
  String campoFormato = 'Atividade Única';

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    listCategorias = jsonDecode(jsonList)['categorias'];
    listProfessores = jsonDecode(jsonList)['professores_id'];
    for (int i = 0; i < listCategorias.length; i++) {
      listDrops.add(
        DropdownMenuItem(
          value: i,
          child: Text(listCategorias[i]['nome']),
        ),
      );
    }
    setState(() {});
  }

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
            Navigator.pop(context);
          },
          icon: Icon(Icons.home),
        ),
        title: Text('Cursos- Novo'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome completo'),
                    TextField(
                      maxLength: 50,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome Breve'),
                    TextField(
                      maxLength: 15,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 20,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Categoria'),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: corEscuro,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: categoriaSelecionada,
                                items: listDrops,
                                onChanged: (newValue) {
                                  setState(() {
                                    categoriaSelecionada = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Visível'),
                        Switch(
                          activeColor: corRoxoMedio,
                          value: visivel,
                          onChanged: (newValue) {
                            setState(() {
                              visivel = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  spacing: 20,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Data Início'),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calendar_month),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Data Fim'),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calendar_month),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sumário do Curso'),
                    TextField(
                      maxLines: 2,

                      maxLength: 200,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Campo Formato'),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: corEscuro,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: campoFormato,
                          items: [
                            DropdownMenuItem(
                              value: 'Atividade Única',
                              child: Text('Atividade Única'),
                            ),
                            DropdownMenuItem(
                              value: 'Formato Social',
                              child: Text('Formato Social'),
                            ),
                            DropdownMenuItem(
                              value: 'Formato tópicos',
                              child: Text('Formato tópicos'),
                            ),
                            DropdownMenuItem(
                              value: 'Formato Semanal',
                              child: Text('Formato Semanal'),
                            ),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              campoFormato = newValue.toString();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Text('Professores'),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  backgroundColor: corClara,
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                    children: [
                                      Text('Professores'),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: corClara,
                                        ),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            border:
                                                OutlineInputBorder(),
                                            suffixIcon: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.search,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: corEscuro,
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: listProfessoresAdd.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsetsGeometry.all(2),
                            child: Container(
                              decoration: BoxDecoration(
                                color: corClara,
                                border: Border.all(
                                  width: 1,
                                  color: corEscuro,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(height: 10),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: corRoxoMedio,
                            foregroundColor: corClara,
                          ),
                          child: Text('Salvar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: corRoxoMedio,
                            foregroundColor: corClara,
                          ),
                          child: Icon(Icons.close),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
