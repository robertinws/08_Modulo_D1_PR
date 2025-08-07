import 'package:flutter/services.dart';

bool conexaoInternet = false, listagemGrid = true;
String jsonList = '';
String caminhoCanal = 'com.example.modulo_d1_pr';
EventChannel eventInternet = EventChannel('$caminhoCanal/internet');
