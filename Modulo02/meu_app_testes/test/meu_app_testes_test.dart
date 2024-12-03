import 'package:meu_app_testes/classes/viacep.dart';
import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'meu_app_testes_test.mocks.dart';

@GenerateMocks([MockViaCep])
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

  group("Calcula o valor do produto com desconto: ", (){
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}:850,
       {'valor': 1000, 'desconto': 15, 'percentual': true}:850,
    };
    valuesToTest.forEach((values, expected){
      test('Entrada: $values: Esperado: $expected', () {
      expect(app.calcularDesconto(
        double.parse(values["valor"].toString()),
        double.parse(values["desconto"].toString()),
        values["percentual"] == true),
        equals(expected));
        });
    });
  });

  group("Calcula o valor do produto informando valores zerados, deve gerar erro: ", (){
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
       {'valor': 1000, 'desconto': 0, 'percentual': true},
    };
    for (var values in valuesToTest) {
      test('Entrada: $values', () {
      expect(
        () => app.calcularDesconto(
        double.parse(values["valor"].toString()),
        double.parse(values["desconto"].toString()),
        values["percentual"] == true),
      throwsA(TypeMatcher<ArgumentError>()));
        });
    }
  });

  test('Testar conversão para uppercase', (){
    expect(app.convertToUper("Dio"), equals("DIO"));
  });

  test('Testar conversão para uppercase teste 2', (){
    expect(app.convertToUper("Dio"), equalsIgnoringCase("dio"));
  });

  test('Valor maior que 50', (){
    expect(app.retornaValor(50), greaterThanOrEqualTo(50));
  });

  test('Começa com D', (){
    expect(app.convertToUper("Dio"), startsWith("D"));
  });

  test('Valor diferente que 50', (){
    expect(app.retornaValor(51), isNot(equals(50)));
  });

  test('Retornar CEP', ()async{
    MockMockViaCEP mockMockViaCep = MockMockViaCEP();
    when(mockMockViaCep.retornarCEP("01001000"))
    .thenAnswer((realInvocation) => Future.value(
      {
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "ibge": "3550308",
      "gia": "1004",
      "ddd": "11",
      "siafi": "7107"
    }
    ));

    var body = await mockMockViaCep.retornarCEP('01001000');
    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

class MockViaCep extends Mock implements viaCep{

}
