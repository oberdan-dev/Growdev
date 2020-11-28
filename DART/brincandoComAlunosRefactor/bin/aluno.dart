import 'dart:math';
import 'pessoa.dart';

enum EStatus { APROVADO, REPROVADO, NAO_DEFINIDO }

class Aluno {
  Pessoa pessoa;
  int _nota;
  EStatus _status;

  int get nota => _nota;
  EStatus get status => _status;

  Aluno(this.pessoa) {
    _nota = 0;
    _status = EStatus.NAO_DEFINIDO;
  }

  List<String> marcarRespostas(
    int tamanhoGabarito,
    List<String> respostasPermitidas,
  ) {
    var respostas = <String>[];

    for (var i = 0; i < tamanhoGabarito; i++) {
      respostas.add(respostasPermitidas[
          Random.secure().nextInt(respostasPermitidas.length)]);
    }
    return respostas;
  }

  void atualizarNotaEStatus(int nota) {
    if (_status != EStatus.NAO_DEFINIDO) {
      throw 'Aluno já realizou a prova';
    }

    _nota = nota;
    _status = nota > 4 ? EStatus.APROVADO : EStatus.REPROVADO;
  }

  @override
  String toString() {
    return 'Nome: ${pessoa.nome} | idade: ${pessoa.idade} | Nota: $_nota | Status: $_status\n';
  }
}
