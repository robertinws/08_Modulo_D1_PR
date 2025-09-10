import 'dart:convert';
import 'dart:typed_data';

import 'package:_08_modulo_d1_pr/global/colors.dart';
import 'package:_08_modulo_d1_pr/global/variaveis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class CadastroProfPage extends StatefulWidget {
  const CadastroProfPage({super.key});

  @override
  State<CadastroProfPage> createState() => _CadastroProfPageState();
}

class _CadastroProfPageState extends State<CadastroProfPage> {
  MaskedTextController telefoneController = MaskedTextController(
    mask: '(00) 00000-0000',
  );
  Uint8List? bytesImage;

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  @override
  void dispose() {
    super.dispose();
    sair();
  }

  void iniciar() async {
    await methodChannel.invokeMethod('print', [1]);
  }

  void sair() async {
    await methodChannel.invokeMethod('print', [2]);
  }

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
        title: Text('Professores - Novo'),
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
                    Text('Nome'),
                    TextField(
                      maxLength: 60,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('E-mail'),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Telefone'),
                    TextField(
                      controller: telefoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Descrição'),
                    TextField(
                      maxLength: 200,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      Text('Imagem'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: corEscuro,
                              ),
                              color: corClara,
                            ),
                            child: bytesImage != null
                                ? InteractiveViewer(
                                    child: Image.memory(
                                      bytesImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () async {
                                      String imagem =
                                          await methodChannel
                                              .invokeMethod('imagem');
                                      if (imagem.isNotEmpty) {
                                        setState(() {
                                          bytesImage = base64Decode(
                                            imagem,
                                          );
                                        });
                                      }
                                    },
                                    child: Container(),
                                  ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
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
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil('/', (context) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: corRoxoMedio,
                  foregroundColor: corClara,
                ),
                child: Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
