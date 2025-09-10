import 'package:_08_modulo_d1_pr/components/bottom_nav_comp.dart';
import 'package:_08_modulo_d1_pr/global/colors.dart';
import 'package:_08_modulo_d1_pr/global/variaveis.dart';
import 'package:_08_modulo_d1_pr/services/infos_dao.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> listFiltrada = [];
  TextEditingController pesquisaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    eventInternet.receiveBroadcastStream().listen((value) {
      valueConexao.value = value;
      if (!valueConexao.value) {
        Fluttertoast.showToast(msg: 'Sem conexão com a internet');
      }
    });
    await InfosDao().verificarLista();
    listFiltrada = listCursos.toList();
    setState(() {});
  }

  void pesquisar(String pesquisa) async {
    if (pesquisa.isEmpty) {
      setState(() {
        listFiltrada = listCursos.toList();
      });
    } else {
      if (pesquisa.contains('@') ||
          pesquisa.contains('#') ||
          pesquisa.contains(r'$')) {
        Fluttertoast.showToast(
          msg: 'Caracteres inválidos não são aceitos',
        );
      } else {
        listFiltrada = listCursos
            .where(
              (item) => item['nomeCompleto'].toString().contains(
                pesquisa.toString(),
              ),
            )
            .toList();
        if (listFiltrada.isEmpty) {
          Fluttertoast.showToast(msg: 'Nenhum curso encontrado');
        } else {
          setState(() {});
        }
      }
    }
  }

  void modalInfos(dynamic curso) async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: corClara,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Informações'),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                Text('Curso:\n${curso['nomeCompleto']}'),
                Text('Nome Breve:\n${curso['nomeBreve']}'),
                Text('Descrição:\n${curso['descricao']}'),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Dashboard'),
        leading: Icon(Icons.home, size: 40),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: listagemGrid
                ? null
                : () {
                    setState(() {
                      listagemGrid = true;
                    });
                  },
            icon: Icon(Icons.grid_view),
          ),
          IconButton(
            onPressed: !listagemGrid
                ? null
                : () {
                    setState(() {
                      listagemGrid = false;
                    });
                  },
            icon: Icon(Icons.list),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 20,
            children: [
              !valueConexao.value
                  ? Container(
                      decoration: BoxDecoration(color: Colors.red),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Uso do aplicativo em modo off-line, os dados podem não estar totalmente atualizados, por conta do uso sem internet.',
                        style: TextStyle(color: corClara),
                      ),
                    )
                  : Container(),
              TextField(
                controller: pesquisaController,
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      listFiltrada = listCursos.toList();
                    });
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Busca',
                  suffixIcon: IconButton(
                    onPressed: () {
                      pesquisar(pesquisaController.text.trim());
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              listagemGrid
                  ? Flexible(
                      child: GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                        itemCount: listFiltrada.length,
                        itemBuilder: (context, index) {
                          final curso = listFiltrada[index];
                          return Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onLongPress: () {
                                  modalInfos(curso);
                                },
                                child: Column(
                                  spacing: 20,
                                  children: [
                                    Stack(
                                      children: [
                                        CircularProgressIndicator(
                                          color: corRoxoClaro,
                                          backgroundColor: corEscuro,
                                          value: curso['porcentagem'],
                                          strokeWidth: 10,
                                          strokeAlign: 2,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsGeometry.only(
                                                top: 9,
                                              ),
                                          child: Text(
                                            '${(curso['porcentagem'] * 100)}%',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(curso['nomeBreve']),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : Flexible(
                      child: ListView.builder(
                        itemCount: listFiltrada.length,
                        itemBuilder: (context, index) {
                          final curso = listFiltrada[index];
                          return Padding(
                            padding: EdgeInsetsGeometry.only(
                              bottom: 10,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                modalInfos(curso);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: corEscuro,
                                  ),
                                ),
                                child: ListTile(
                                  leading: Stack(
                                    children: [
                                      CircularProgressIndicator(
                                        color: corRoxoClaro,
                                        backgroundColor: corEscuro,
                                        value: curso['porcentagem'],
                                        strokeWidth: 5,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsetsGeometry.only(
                                              top: 11,
                                              left: 4,
                                            ),
                                        child: Text(
                                          '${(curso['porcentagem'] * 100)}%',
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Text(curso['nomeBreve']),
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
        onPressed: () {},
        icon: Icon(Icons.note_add, size: 30),
      ),
      bottomNavigationBar: BottomNavComp(contexto: context),
    );
  }
}
