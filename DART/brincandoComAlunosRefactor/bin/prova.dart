import 'aluno.dart';

class Prova {
  List<String> _gabarito = ['A', 'C', 'B', 'C', 'B', 'C', 'A', 'B', 'B', 'A'];
  List<String> _possiveisRespostas = ['A', 'B', 'C'];

  int aplicarProva(Aluno aluno) {
    var respostasAluno =
        aluno.marcarRespostas(_gabarito.length, _possiveisRespostas);

    var nota = _corrigirProva(respostasAluno);

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
