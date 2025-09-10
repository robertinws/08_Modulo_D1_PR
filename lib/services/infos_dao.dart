import 'dart:convert';
import 'dart:io';
import 'package:_08_modulo_d1_pr/global/variaveis.dart';
import 'package:flutter/services.dart';

class InfosDao {
  Future<File> getFile() async {
    final directory = Directory.systemTemp;
    final path = directory.path;
    return File('$path/list.json');
  }

  Future<void> verificarLista() async {
    final file = await getFile();
    if (await file.exists()) {
      String jsonString = await file.readAsString();
      listCursos = jsonDecode(jsonString);
    } else {
      listCursos = jsonDecode(
        await rootBundle.loadString('assets/jsons/dados.json'),
      )['cursos'];
      await file.writeAsString(jsonEncode(listCursos));
    }
  }

  Future<void> addListaCurso(dynamic curso) async {
    final file = await getFile();
    listCursos.add(curso);
    await file.writeAsString(jsonEncode(listCursos));
  }
}
