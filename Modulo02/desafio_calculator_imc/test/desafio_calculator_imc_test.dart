import 'package:test/test.dart';
import 'package:desafio_calculator_imc/utils.dart';

import '../bin/desafio_calculator_imc.dart';

void main() {
  group('Testes de Cálculo IMC', () {
    test('Calcula o IMC corretamente', () {
      double peso = 86;
      double altura = 1.83;
      double imc = resultIMC(peso, altura);

      expect(imc, closeTo(25.68, 0.01));
    });

    test('Verifica categoria IMC - Saudável', () {
      double imc = 22.0;
      String categoria = categoriaIMC(imc);

      expect(categoria, equals("SAUDÁVEL"));
    });

    test('Verifica categoria IMC - Obesidade Grau I', () {
      double imc = 32.0;
      String categoria = categoriaIMC(imc);

      expect(categoria, equals("OBESIDADE GRAU I"));
    });

    test('Verifica entrada de nome válido', () {
      var nome = lerConsoleNome("Teste Nome");
      expect(RegExp(r'^[a-zA-Z\s]+$').hasMatch(nome), isTrue);
    });

    test('Calcula IMC - valores negativos ou zero', () {
      expect(() => resultIMC(-10, 1.75), throwsA(isA<Exception>()));
      expect(() => resultIMC(60, 0), throwsA(isA<Exception>()));
    });
  });
}
