import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulo_d1_pr/global/colors.dart';
import 'package:modulo_d1_pr/global/variaveis.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> listCursos = [];

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    eventInternet.receiveBroadcastStream().listen((value) {
      setState(() {
        conexaoInternet = (value == 1);
      });
    });
    jsonList = await rootBundle.loadString('assets/jsons/dados.json');
    listCursos = jsonDecode(jsonList)['cursos'];
    setState(() {});
  }

  void abrirModal(index) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: corClara,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Informações',
                style: TextStyle(
                  color: corEscuro,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              Text('Curso:\n${listCursos[index]['nomeCompleto']}'),
              Text('Descrição:\n${listCursos[index]['descricao']}'),
              Text(
                'Data Início:\n${listCursos[index]['dataInicio']}',
              ),
              Text('Data Fim:\n${listCursos[index]['dataFim']}'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corClara,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Icon(Icons.home, color: corEscuro),
        title: Text('DashBoard'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                listagemGrid = true;
              });
            },
            icon: Icon(
              Icons.grid_view_outlined,
              color: listagemGrid ? corRoxoMedio : corEscuro,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                listagemGrid = false;
              });
            },
            icon: Icon(
              Icons.list,
              color: !listagemGrid ? corRoxoMedio : corEscuro,
            ),
          ),
        ],
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
              conexaoInternet
                  ? Container()
                  : Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.red),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          'Sem conexão com internet, os dados podem não estar totalmentes atualizados.',
                          style: TextStyle(
                            color: corClara,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
              Container(height: 10),
              listCursos.isEmpty
                  ? Container()
                  : listagemGrid
                  ? Flexible(
                      child: GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                        shrinkWrap: true,
                        itemCount: listCursos.length,
                        itemBuilder: (context, index) {
                          final curso = listCursos[index];
                          return GestureDetector(
                            onTap: () {
                              abrirModal(index);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Padding(
                                    padding: EdgeInsetsGeometry.all(
                                      5,
                                    ),
                                    child: Stack(
                                      children: [
                                        Transform.rotate(
                                          angle: 3.9,
                                          child: CircularProgressIndicator(
                                            value:
                                                curso['porcentagem'],
                                            strokeWidth: 9,
                                            color: corEscuro,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsGeometry.only(
                                                top: 10,
                                              ),
                                          child: Icon(
                                            Icons.person,
                                            size: 40,
                                            color: corClara,
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            textAlign:
                                                TextAlign.center,
                                            '${curso['porcentagem']}%',
                                            style: TextStyle(
                                              color: corEscuro,
                                              fontSize: 10,
                                              fontWeight:
                                                  FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(curso['nomeBreve']),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : Flexible(
                      child: ListView.builder(
                        itemCount: listCursos.length,
                        itemBuilder: (context, index) {
                          final curso = listCursos[index];
                          return Padding(
                            padding: EdgeInsetsGeometry.all(5),
                            child: GestureDetector(
                              onTap: () {
                                abrirModal(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: corClara,
                                  border: Border.all(
                                    width: 1,
                                    color: corEscuro,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsGeometry.all(5),
                                  child: Row(
                                    spacing: 10,
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsGeometry.all(
                                                5,
                                              ),
                                          child: Stack(
                                            children: [
                                              Transform.rotate(
                                                angle: 3.9,
                                                child: CircularProgressIndicator(
                                                  value:
                                                      curso['porcentagem'],
                                                  strokeWidth: 9,
                                                  color: corEscuro,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsGeometry.only(
                                                      top: 10,
                                                    ),
                                                child: Icon(
                                                  Icons.person,
                                                  size: 40,
                                                  color: corClara,
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  textAlign: TextAlign
                                                      .center,
                                                  '${curso['porcentagem']}%',
                                                  style: TextStyle(
                                                    color: corEscuro,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight
                                                            .w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        curso['nomeBreve'],
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: corEscuro,
                                        ),
                                      ),
                                    ],
                                  ),
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
          Navigator.of(context).pushNamed('/cadastroCurso');
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
              Image.asset(
                height: 40,
                'assets/images/cursos.png',
                fit: BoxFit.cover,
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
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed('/relatorios');
                },
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
