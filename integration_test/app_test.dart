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

    await tester.longPress(find.text('Lógica'));
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

    await tester.tap(find.text('Lógica'));
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

    await tester.tap(find.text('Salvar'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Salvar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.enterText(
      find.byType(TextField).first,
      'Desenvolvimento de Aplicativos Móveis',
    );
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Nome Completo inserido');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Salvar'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Salvar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.enterText(find.byType(TextField).at(1), 'Mobile');
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Nome Breve inserido');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Salvar'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Salvar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byType(DropdownButtonHideUnderline).first);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Dropdown clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Qualidade de Software'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Categoria selecionada clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Salvar'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Salvar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.date_range).first);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Campo Data Início clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.edit_outlined));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão editar clicado');
    await tester.pump(Duration(seconds: 1));

    tester.testTextInput.enterText('02/15/2025');
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Data Início inserida');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('OK'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão OK clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Salvar'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Salvar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.date_range).first);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Campo Data Início clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.edit_outlined));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão editar clicado');
    await tester.pump(Duration(seconds: 1));

    tester.testTextInput.enterText('11/12/2025');
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Data Início inserida');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('OK'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão OK clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.date_range).last);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Campo Data Fim clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.edit_outlined));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão editar clicado');
    await tester.pump(Duration(seconds: 1));

    tester.testTextInput.enterText('10/12/2025');
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Data Fim inserida');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('OK'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão OK clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Salvar'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Salvar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.date_range).last);
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Campo Data Fim clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.edit_outlined));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão editar clicado');
    await tester.pump(Duration(seconds: 1));

    tester.testTextInput.enterText('12/12/2025');
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Data Fim inserida');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('OK'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão OK clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Salvar'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Salvar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Adicionar clicado');
    await tester.pump(Duration(seconds: 1));

    for (int i = 0; i < 6; i++) {
      await tester.tap(find.byKey(Key('key$i')));
      await tester.pump(Duration(seconds: 1));
      await tester.pump(Duration(seconds: 1));

      tester.printToConsole('Botão Adicionar Professor clicado');
      await tester.pump(Duration(seconds: 1));
    }

    for (int i = 0; i < 2; i++) {
      await tester.tap(find.byKey(Key('key$i')));
      await tester.pump(Duration(seconds: 1));
      await tester.pump(Duration(seconds: 1));

      tester.printToConsole('Botão Remover Professor clicado');
      await tester.pump(Duration(seconds: 1));
    }

    await tester.tap(find.byIcon(Icons.close));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Close clicado para fechar o modal');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.text('Salvar'));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Salvar clicado');
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byKey(Key('btnProfs')));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole(
      'Botão Professores clicado no NavigationBar',
    );
    await tester.pump(Duration(seconds: 1));

    await tester.tap(find.byIcon(Icons.note_add));
    await tester.pump(Duration(seconds: 1));
    await tester.pump(Duration(seconds: 1));

    tester.printToConsole('Botão Flutuante clicado');
    await tester.pump(Duration(seconds: 1));
  });
}
