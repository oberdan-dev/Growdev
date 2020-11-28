import 'aluno.dart';

class Prova {
  List<String> _gabarito = ['A', 'C', 'B', 'C', 'B', 'C', 'A', 'B', 'B', 'A'];
  List<String> _possiveisRespostas = ['A', 'B', 'C'];

  List<Map<String, dynamic>> _alunos;

  Prova() {
    _alunos = [];
  }

  int aplicarProva(Aluno aluno) {
    if (_alunos.firstWhere(
            (alunoMap) =>
                aluno.pessoa.id == (alunoMap['aluno'] as Aluno).pessoa.id,
            orElse: () => null) !=
        null) {
      throw 'Aluno já fez a prova';
    }

    var respostasAluno =
        aluno.marcarRespostas(_gabarito.length, _possiveisRespostas);

    var nota = _corrigirProva(respostasAluno);

    _alunos.add({'aluno': aluno, 'nota': nota});

    return nota;
  }

  int _corrigirProva(List<String> respostas) {
    var total = 0;
    for (var i = 0; i < _gabarito.length; i++) {
      if (respostas[i] == _gabarito[i]) {
        total++;
      }
    }
    return total;
  }
}
