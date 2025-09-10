import 'package:_08_modulo_d1_pr/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Testes Módulo D1', (tester) async {
    await tester.pumpWidget(AppController());
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Aplicação iniciada');
    await tester.pump(Duration(seconds: 1));

    await tester.enterText(find.byType(TextField), r'@#$');
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Texto inserido');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.search));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão pesquisar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.enterText(
      find.byType(TextField),
      'Matemática-Avançada',
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Texto inserido');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.search));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão pesquisar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.enterText(find.byType(TextField), 'Mate');
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Texto inserido');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.search));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão pesquisar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.enterText(find.byType(TextField), 'Física Quântica');
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Texto inserido');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.search));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão pesquisar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.enterText(find.byType(TextField), '');
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Texto inserido');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.grid_view));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão grid clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.longPress(find.text('Lóg'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Curso Lógica de Programação pressionado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.close));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão close clicado para fechar modal');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.list));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão list clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Lóg'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Curso Lógica de Programação clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.close));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão close clicado para fechar modal');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.note_add));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão flutuante clicado');
    await tester.pump(Duration(seconds: 1));
  });
}
