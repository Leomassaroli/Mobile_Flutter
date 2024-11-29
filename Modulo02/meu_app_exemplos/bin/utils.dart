import 'dart:convert';
import 'dart:io';

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync(encoding: utf8);
  return line ?? "";
}

double lerConsoleDouble(String texto) {
  var numero = double.tryParse(lerConsole(texto));
  if (numero == null) {
    print("Número informado incorreto, alterando para 0!");
    return 0.0;
  } else {
    return numero;
  }
}

double somaLista(List<double>numeros) {
  double acumulate = 0;
  for (var numero in numeros) {
    acumulate = soma(acumulate, numero);
  }
  return acumulate;
}

double soma(double number1, number2) {
  return number1 + number2;
}

double subtracao(double number1, number2) {
  return number1 - number2;
}

double multi(double number1, number2) {
  return number1 * number2;
}

double divisao(double number1, number2) {
  if (number2 == 0) {
    print("Não é possível dividir por 0");
    exit(0);
  } else {
    return number1 / number2;
  }
}