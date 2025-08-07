import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modulo_d1_pr/global/colors.dart';
import 'package:modulo_d1_pr/global/variaveis.dart';

class CadastroProfessorPage extends StatefulWidget {
  const CadastroProfessorPage({super.key});

  @override
  State<CadastroProfessorPage> createState() =>
      _CadastroProfessorPageState();
}

class _CadastroProfessorPageState
    extends State<CadastroProfessorPage> {
  Uint8List? bytesImage;
  MethodChannel methodChannel = MethodChannel('$caminhoCanal/main');

  void selecionarImagem() async {
    String img64 = await methodChannel.invokeMethod('imagem');
    if (img64.isNotEmpty) {
      setState(() {
        bytesImage = base64Decode(img64);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corClara,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Professores - Novo'),
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
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome'),
                  Container(
                    decoration: BoxDecoration(color: corClara),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('E-mail'),
                  Container(
                    decoration: BoxDecoration(color: corClara),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Telefone'),
                  Container(
                    decoration: BoxDecoration(color: corClara),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Descrição'),
                  Container(
                    decoration: BoxDecoration(color: corClara),
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Imagem'),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        selecionarImagem();
                      },
                      child: Container(
                        width: 300,
                        height: 150,
                        decoration: BoxDecoration(
                          color: corClara,
                          border: Border.all(
                            width: 1,
                            color: corEscuro,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: bytesImage != null
                            ? InteractiveViewer(
                                child: Image.memory(
                                  bytesImage!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Navigator.of(context).pushReplacementNamed('/');
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
        ),
      ),
    );
  }
}
