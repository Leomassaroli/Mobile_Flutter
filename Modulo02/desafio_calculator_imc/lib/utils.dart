import 'dart:convert';
import 'dart:io';

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync(encoding: utf8);
  return line ?? "";
}

String lerConsoleNome(String texto) {
  while (true) {
    var nome = lerConsole(texto).trim();
    if (nome.isNotEmpty && RegExp(r'^[a-zA-Z\s]+$').hasMatch(nome)) {
      return nome;
    } else {
      print("O nome inserido é inválido! Por favor, insira apenas letras e espaços.");
    }
  }
}

double lerConsolePeso(String texto) {
  while (true) {
    var peso = double.tryParse(lerConsole(texto));
    if (peso != null && peso > 0) {
      return peso;
    } else {
      print("O peso inserido está incorreto! Por favor, tente novamente.");
    }
  }
}

double lerConsoleAltura(String texto) {
  while (true) {
    var altura = double.tryParse(lerConsole(texto));
    if (altura != null && altura > 0) {
      return altura;
    } else {
      print("A altura inserida está incorreta! Por favor, tente novamente.");
    }
  }
}

double resultIMC(double peso, double altura) {
  return peso / (altura * altura);
}