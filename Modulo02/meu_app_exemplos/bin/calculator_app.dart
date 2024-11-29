import 'dart:io';
import 'utils.dart' as utils;

void main(List<String> arguments) {
  print("Bem vindos a minha calculadora!");

  var number1 = utils.lerConsoleDouble("Informe o 1º número: ");

  var number2 = utils.lerConsoleDouble("Informe o 2º número: ");

  var operation = utils.lerConsole("Informe a operação matemática (+, -, *, /): ");

  calculate(operation, number1, number2);
}

void calculate(String operation, double number1, double number2) {
  double result = 0;
  switch (operation) {
    case "+":
      result = utils.soma(number1, number2);
      break;
    case "-":
      result = utils.subtracao(number1, number2);
      break;
    case "*":
      result = utils.multi(number1, number2);
      break;
    case "/":
      result = utils.divisao(number1, number2);
      break;
    default:
      print("Operação inválida!");
      exit(0);
  }
  print("Operação solicitada: $operation");
  print("O resultado da operação solicitada é: $result");
}
