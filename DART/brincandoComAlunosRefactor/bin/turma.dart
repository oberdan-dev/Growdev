import 'aluno.dart';
import 'prova.dart';

class Turma {
  List<Aluno> _alunos;

  Aluno get melhorAluno => alunosOrdenados.last;
  Aluno get piorAluno => alunosOrdenados.first;

  List<Aluno> get alunos => List.unmodifiable(_alunos);

  List<Aluno> get alunosOrdenados {
    var alunosOrdenados = _alunos;

    alunosOrdenados.sort((a1, a2) => a1.nota.compareTo(a2.nota));
    return alunosOrdenados;
  }

  Turma() {
    _alunos = [];
  }

  void matricularAluno(Aluno novoAluno) {
    var alunoJaCadastrado = _alunos.firstWhere((aluno) {
          var eIgual = aluno.pessoa.nome.toUpperCase() ==
              novoAluno.pessoa.nome.toUpperCase();

          return eIgual;
        }, orElse: () => null) !=
        null;

    if (alunoJaCadastrado) {
      throw 'Aluno já cadastrado';
    }

    _alunos.add(novoAluno);
  }

  void aplicarProva(Prova prova) {
    for (var aluno in _alunos) {
      var nota = prova.aplicarProva(aluno);
      aluno.atualizarNotaEStatus(nota);
    }
  }

  int mediaTurma() {
    return _alunos
            .map((aluno) => aluno.nota)
            .reduce((soma, nota) => soma + nota) ~/
        _alunos.length;
  }

  int totalTurma() {
    return _alunos
        .map((aluno) => aluno.nota)
        .reduce((soma, nota) => soma + nota);
  }

  List<Aluno> alunosAprovados() =>
      _alunos.where((aluno) => aluno.status == EStatus.APROVADO).toList();
  List<Aluno> alunosReprovados() =>
      _alunos.where((aluno) => aluno.status == EStatus.REPROVADO).toList();
}
