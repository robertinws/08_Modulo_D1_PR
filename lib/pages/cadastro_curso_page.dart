import 'package:_08_modulo_d1_pr/global/colors.dart';
import 'package:flutter/material.dart';

class CadastroCursoPage extends StatefulWidget {
  const CadastroCursoPage({super.key});

  @override
  State<CadastroCursoPage> createState() => _CadastroCursoPageState();
}

class _CadastroCursoPageState extends State<CadastroCursoPage> {
  bool visivel = false;
  TextEditingController nomeCompletoController =
          TextEditingController(),
      nomeBreveController = TextEditingController(),
      dataInicioController = TextEditingController(),
      dataFimController = TextEditingController(),
      sumarioController = TextEditingController();
  String dataInicio = '', dataFim = '';
  int? categoria, formato = 0;

  void salvarCurso() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corClara,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Cursos - Novo'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/', (context) => false);
          },
          icon: Icon(Icons.home, size: 40),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome Completo'),
                    TextField(
                      maxLength: 50,
                      controller: nomeCompletoController,
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
                      controller: nomeBreveController,
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
                                isExpanded: true,
                                value: categoria,
                                hint: Text('Selecione uma categoria'),
                                items: List.generate(4, (index) {
                                  return DropdownMenuItem(
                                    value: index,
                                    child: Text('Item'),
                                  );
                                }),
                                onChanged: (newValue) {
                                  setState(() {
                                    categoria = newValue;
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
                  spacing: 15,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Data Início'),
                          TextField(
                            controller: dataInicioController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.date_range),
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
                            controller: dataFimController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.date_range),
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
                      maxLength: 200,
                      controller: sumarioController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Formato'),
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
                          isExpanded: true,
                          value: formato,
                          items: List.generate(4, (index) {
                            return DropdownMenuItem(
                              value: index,
                              child: Text('Item'),
                            );
                          }),
                          onChanged: (newValue) {
                            setState(() {
                              formato = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Professores'),
                    IconButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              backgroundColor: corClara,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                spacing: 10,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Busca',
                                      suffixIcon: Icon(Icons.search),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 200,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: List.generate(5, (
                                          index,
                                        ) {
                                          return ListTile(
                                            title: Text('Prof'),
                                            trailing: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.add),
                                            ),
                                          );
                                        }),
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
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: corEscuro),
                  ),
                  padding: EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: EdgeInsetsGeometry.only(bottom: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: corEscuro,
                              ),
                            ),
                            child: ListTile(
                              onTap: () {},
                              title: Text('Prof'),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: salvarCurso,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: corRoxoMedio,
                        foregroundColor: corClara,
                      ),
                      child: Text('Salvar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/',
                          (context) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: corRoxoMedio,
                        foregroundColor: corClara,
                      ),
                      child: Text('Cancelar'),
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
