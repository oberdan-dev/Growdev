import 'aluno.dart';
import 'pessoa.dart';
import 'prova.dart';
import 'turma.dart';

void main(List<String> arguments) {
  var turma = Turma();
  var prova = Prova();

  for (var i = 0; i < 10; i++) {
    turma.matricularAluno(Aluno(Pessoa('Aluno ${i + 1}', (20 + i))));
  }

  turma.aplicarProva(prova);

  print('Média da turma: ${turma.mediaTurma()}');
  print('Total da turma: ${turma.totalTurma()}');
  print('Pior Aluno: ${turma.piorAluno}');
  print('Melhor Aluno: ${turma.melhorAluno}');
  print('==== Alunos aprovados ====');
  print(turma.alunosAprovados());
  print('==== Alunos reprovados ====');
  print(turma.alunosReprovados());
}
