import 'package:desafio_calculator_imc/utils.dart' as utils;

void main(List<String> arguments){
  print("Essa é minha calculadora IMC!");

  var nome = utils.lerConsoleNome("Informe o seu nome: ");

  var peso = utils.lerConsolePeso("Informe qual o seu peso atualmente: ");

  var altura = utils.lerConsoleAltura("Informe qual a sua altura atualmente: ");

  calculate(nome, peso, altura);
}

  String categoriaIMC(double result) {
  if (result < 16) {
    return "MAGREZA GRAVE";
  } else if (result >= 16 && result <= 17) {
    return "MAGREZA MODERADA";
  } else if (result >= 17 && result <= 18.5) {
    return "MAGREZA LEVE";
  } else if (result >= 18.5 && result <= 25) {
    return "SAUDÁVEL";
  } else if (result >= 25 && result <= 30) {
    return "SOBREPESO";
  } else if (result >= 30 && result <= 35) {
    return "OBESIDADE GRAU I";
  } else if (result >= 35 && result <= 40) {
    return "OBESIDADE GRAU II (SEVERA)";
  } else {
    return "OBESIDADE GRAU III (MÓRBIDA)";
  }
}

void calculate (String nome, double peso, double altura){
  double result = utils.resultIMC(peso, altura);
  String categoria = categoriaIMC(result);
  print("$nome, conforme seu cálculo IMC, você está com $categoria!");
}