/*
Debido a la naturaleza de flutter que todo son widgets escritos en dart
esto permite hacer pruebas muy rápidas y poco pesadas sobre los elementos de nuestra UI

El objetivo de una prueba de widgets es verificar que la UI del widget se vea e interactúe como
se espera. Probar un widget implica múltiples clases y requiere un entorno de prueba que
proporcione el contexto apropiado del ciclo de vida del widget.

Una de las clases que mas usaremos sera: CommonFinders.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/main.dart';
import 'package:testing_app/reverse_string.dart';

void main() {
  testWidgets('Reversed string when press button', (WidgetTester tester) async {
    // Representa la ui apartir del widget dado.
    await tester.pumpWidget(MyApp());
/*
Podemos buscar widgets por muchos campos:
  type finder.byType
  key finder.byKey
  text finder.textfinder.widgetWithText
  icon finder.byIcon
  create a duplicate widget in your test finder.byWidget
  regex finder.bySemanticsLabel
 */
    var textField = find.byType(TextField);
    // Estamos esperando que textfield se encuentre.
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'Hello');
    expect(find.text('Hello'), findsOneWidget);
    var button = find.text("Reverse");
    expect(button,findsOneWidget);

    // con tap estamos pulsando el "boton" y com pump estamos volviendo a pintar los widgets
    // que reciban algun cambio
    await tester.tap(button);
    await tester.pump();

    expect(find.text("olleH"),findsOneWidget);

  }
  );
}
