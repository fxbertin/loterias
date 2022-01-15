import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:loteria/main.dart';
import 'package:loteria/screens/dashboard.dart';
import 'package:loteria/screens/resultado.dart';
import 'package:loteria/tipos_jogos.dart';

void main() {
  testWidgets('Tem que ter um botão para cada tipo de jogo',
      (WidgetTester tester) async {
    await tester.pumpWidget(Loteria());

    final totalJogos = Jogo.values.length;
    expect(find.byType(Dashboard), findsOneWidget);
    expect(find.byType(InkWell), findsNWidgets(totalJogos));

    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        return widget.data == Jogo.megaSena.nome;
      }
      return false;
    }));
    await tester.pumpAndSettle();
    expect(find.byType(TelaResultado), findsOneWidget);
  });

  testWidgets('Se clicar em algum jogo abre a tela de resultado',
      (WidgetTester tester) async {
    await tester.pumpWidget(Loteria());

    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is Text) {
        return widget.data == Jogo.megaSena.nome;
      }
      return false;
    }));
    await tester.pumpAndSettle();
    expect(find.byType(TelaResultado), findsOneWidget);
  });
}
