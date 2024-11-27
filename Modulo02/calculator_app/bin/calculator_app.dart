import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  print("Bem vindos a minha calculadora!");

  var number1 = lerConsoleDouble("Informe o 1º número: ");

  var number2 = lerConsoleDouble("Informe o 2º número: ");

  var operation = lerConsole("Informe a operação matemática (+, -, *, /): ");

  calculate(operation, number1, number2);
}

void calculate(String operation, double number1, double number2) {
  double result = 0;
  switch (operation) {
    case "+":
      result = soma(number1, number2);
      break;
    case "-":
      result = subtracao(number1, number2);
      break;
    case "*":
      result = multi(number1, number2);
      break;
    case "/":
      result = divisao(number1, number2);
      break;
    default:
      print("Operação inválida!");
      exit(0);
  }
  print("Operação solicitada: $operation");
  print("O resultado da operação solicitada é: $result");
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

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync(encoding: utf8);
  return line ?? "";
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
