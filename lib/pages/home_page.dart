import 'package:_08_modulo_d1_pr/global/colors.dart';
import 'package:_08_modulo_d1_pr/global/variaveis.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void modalInfos() async {
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
              mainAxisSize: MainAxisSize.min,
              spacing: 15,
              children: [
                Text('Curso:\nwojdowj'),
                Text('Descrição:\nwojdowj'),
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
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Busca',
                  suffixIcon: IconButton(
                    onPressed: () {},
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
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Column(
                                spacing: 20,
                                children: [
                                  Stack(
                                    children: [
                                      CircularProgressIndicator(
                                        color: corRoxoClaro,
                                        backgroundColor: corEscuro,
                                        value: 0.5,
                                        strokeWidth: 10,
                                        strokeAlign: 2,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsetsGeometry.only(
                                              top: 9,
                                              left: 5,
                                            ),
                                        child: Text('10%'),
                                      ),
                                    ],
                                  ),
                                  Text('Item $index'),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : Flexible(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsetsGeometry.only(
                              bottom: 10,
                            ),
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
                                      value: 0.3,
                                      strokeWidth: 5,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsetsGeometry.only(
                                            top: 11,
                                            left: 8,
                                          ),
                                      child: Text(
                                        '20%',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text('Item $index'),
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Image.asset(
                  height: 50,
                  'assets/images/cursos.png',
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                child: Image.asset(
                  height: 50,
                  'assets/images/profs.png',
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                child: Image.asset(
                  height: 50,
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
