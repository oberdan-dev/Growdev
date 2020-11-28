import 'aluno.dart';

abstract class TurmaAcoes {
  void matriculaAluno(Aluno novoAluno);
  Future<void> salvaTurmaJson();
  Future<bool> recuperaTurmaJson();
  List<Aluno> alunosAprovados();
  List<Aluno> alunosReprovados();
  double calculaMediaAlunos();
  double calculaTotalNotas();
}
