import 'package:_08_modulo_d1_pr/components/bottom_nav_comp.dart';
import 'package:_08_modulo_d1_pr/global/colors.dart';
import 'package:_08_modulo_d1_pr/global/variaveis.dart';
import 'package:flutter/material.dart';

class ProfsPage extends StatefulWidget {
  const ProfsPage({super.key});

  @override
  State<ProfsPage> createState() => _ProfsPageState();
}

class _ProfsPageState extends State<ProfsPage> {
  int profSelecionado = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corClara,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/', (context) => false);
          },
          icon: Icon(Icons.home, size: 40),
        ),
        scrolledUnderElevation: 0,
        title: Text('Professores'),
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
              Flexible(
                child: ListView.builder(
                  itemCount: listProfessores.length,
                  itemBuilder: (context, index) {
                    final prof = listProfessores[index];
                    return Padding(
                      padding: EdgeInsetsGeometry.only(bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: corEscuro,
                          ),
                        ),
                        child: ListTile(
                          title: Text(prof['nome']),
                          subtitle: Text(prof['descricao']),
                          trailing: profSelecionado == index
                              ? IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                )
                              : IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.transparent,
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
        onPressed: () {},
        icon: Icon(Icons.note_add),
      ),
      bottomNavigationBar: BottomNavComp(contexto: context),
    );
  }
}
