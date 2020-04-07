import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/reverse_string.dart';
/*
Un archivo de test es un archivo dart normal pero que lo nombramos con _test para diferenciarlo
en su interior tiene una función principal (main) y luego dentro de ella funciones TEST
 
 Qué esperamos de una prueba unitaria 1 que sea rápida , que su alcance sea estrecho/ cerrado,
 y que sean funciones simples que si tiene un valor de entrada siempre espere el mismo de salida

Hay que aislarse de cualquier dependencia que no esté bajo nuestro control y que no sea fundamental
para la función que queremos acabar comprobando
 */

void main() {
  test('String should be reversed', () {
    String initial = "Hello";
    String reversed = reverseString(initial);
    expect(reversed, 'olleH');
  });
}
