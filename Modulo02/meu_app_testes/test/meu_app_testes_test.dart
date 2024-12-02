import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('calcular o valor do produto com desconto não sendo porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test('calcular o valor do produto com desconto não sendo porcentagem passando valor do produto zerado', () {
    expect(() => app.calcularDesconto(0, 150, false), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('calcular o valor do produto com desconto sendo porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  test('calcular o valor do produto com desconto zerado', () {
    expect(() => app.calcularDesconto(1000, 0, true), throwsA(TypeMatcher<ArgumentError>()));
  });
}
