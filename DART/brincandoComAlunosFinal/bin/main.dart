import 'aluno.dart';
import 'pessoa.dart';
import 'prova.dart';
import 'turma_nova.dart';

void main() async {
  TurmaNova advanced = TurmaNova(1);

  if (!(await advanced.recuperaTurmaJson())) {
    Prova prova = Prova();

    for (var i = 0; i < 10; i++) {
      advanced.matriculaAluno(Aluno(Pessoa('Aluno ${i + 1}', (20 + i), i + 1)));
    }

    advanced.aplicarProva(prova);

    advanced.salvaTurmaJson();

    print('Média da turma: ${advanced.calculaMediaAlunos()}');
    print('Total da turma: ${advanced.calculaTotalNotas()}');
    print('Pior Aluno: ${advanced.piorAluno}');
    print('Melhor Aluno: ${advanced.melhorAluno}');
    print('==== Alunos aprovados ====');
    print(advanced.alunosAprovados());
    print('==== Alunos reprovados ====');
    print(advanced.alunosReprovados());
  }
}
