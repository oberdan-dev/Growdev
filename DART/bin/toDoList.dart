// Receba do usuário no mínimo 5 tarefas do dia-a-dia.
// Á partir da quinta tarefa, quando o usuário digitar 'exit' parar a coleta de tarefas.
// Definir valores de "concluído" ou "não concluído" aleatoriamente para cada tarefa recebida.
// Em seguida  criar uma lista de tarefas concluídas e outra de tarefas não concluídas e imprimir ambas.
// Dica: Use Map, List, e "lista.where".

import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  var toDo = <Map<String, dynamic>>[];

  String entrada;
  var qtdTasks = 0;

  while (true) {
    var status =
        Random.secure().nextInt(2) == 0 ? 'Nao concluido' : 'Concluido';
    print('Digite uma tarefa');
    entrada = stdin.readLineSync();

    toDo.add({'Tarefa': entrada, 'Status': status});
    qtdTasks++;
    if (qtdTasks > 5 && entrada == 'exit') {
      break;
    }
  }

  tarefasConcluidas() =>
      toDo.where((tasks) => tasks['Status'] == 'Concluido').toList();
  tarefasNaoConcluidas() =>
      toDo.where((tasks) => tasks['Status'] == 'Nao concluido').toList();

  print('====== Tarefas Concluídas ======');
  print(tarefasConcluidas().isEmpty ? 'Nenhuma tarefa' : tarefasConcluidas());
  print('====== Tarefas Não Concluídas ======');
  print(tarefasNaoConcluidas().isEmpty
      ? 'Nenhuma tarefa'
      : tarefasNaoConcluidas());
}
