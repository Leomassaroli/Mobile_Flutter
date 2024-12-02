import 'dart:io';

import 'package:meu_app_ex/exception/nome_invalido_exception.dart';
import 'package:meu_app_ex/models/aluno.dart';
import 'package:meu_app_ex/models/console_utils.dart';

void execute(){
  print("Bem vindo ao sistema de notas!");
  String line = ConsoleUtils.lerStringComTexto("Digite o nome do aluno:");
  try {
    if (line.trim() == "") {
    throw NomeInvalidoException();
    }
  }on NomeInvalidoException{
    line = "Nome padrão";
    print(NomeInvalidoException);
    exit(0);
  }
  catch (e) {
    print(e);
    exit(0);
  }
  var aluno = Aluno(line);
  double? nota;
  do {
    nota = ConsoleUtils.lerDoubleTextoSaida("Digite a nota ou S para sair", "S");
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);
  print("As notas digitadas foram: ${aluno.getNotas()}");
  print("A média do aluno é: ${aluno.retornaMedia()}");
  if (aluno.aprovado(7)){
    print("O aluno ${aluno.getNome()} foi aprovado!");
  }else{
    print("O aluno ${aluno.getNome()} foi reprovado!");
  }
}