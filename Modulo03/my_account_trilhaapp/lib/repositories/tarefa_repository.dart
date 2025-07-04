import 'package:trilhaapp/models/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(seconds: 1));
    _tarefas
        .where((tarefa) => tarefa.GetId() == id)
        .first
        .setConcluido(concluido);
  }

  Future<List<Tarefa>> listarTarefas() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas;
  }
}
