import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

bool listagemGrid = false;
List<dynamic> listCursos = [];
String caminhoCanal = 'com.example_08_modulo_d1_pr';
EventChannel eventInternet = EventChannel('$caminhoCanal/internet');
ValueNotifier<bool> valueConexao = ValueNotifier(false);
