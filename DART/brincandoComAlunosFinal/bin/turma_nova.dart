import 'dart:convert';
import 'dart:io';

import 'entidade.dart';
import 'aluno.dart';
import 'pessoa.dart';
import 'prova.dart';
import 'turmaAcoes.dart';

class TurmaNova extends Entidade implements TurmaAcoes {
  List<Aluno> _alunos;
  List<Aluno> get alunos => List.unmodifiable(_alunos);

  Aluno get melhorAluno => alunosOrdenados.last;
  Aluno get piorAluno => alunosOrdenados.first;

  List<Aluno> get alunosOrdenados {
    var alunosOrdenados = _alunos;

    alunosOrdenados.sort((a1, a2) => a1.nota.compareTo(a2.nota));
    return alunosOrdenados;
  }

  TurmaNova(int id) : super(id) {
    _alunos = [];
  }

// ------------------

  Map<String, dynamic> toJson() {}

  void aplicarProva(Prova prova) {
    for (var aluno in _alunos) {
      var nota = prova.aplicarProva(aluno);
      aluno.atualizarNotaEStatus(nota);
    }
  }

// ------------------

  @override
  List<Aluno> alunosAprovados() =>
      _alunos.where((aluno) => aluno.status == EStatus.APROVADO).toList();

  @override
  List<Aluno> alunosReprovados() =>
      _alunos.where((aluno) => aluno.status == EStatus.REPROVADO).toList();

  @override
  double calculaMediaAlunos() {
    return _alunos
            .map((aluno) => aluno.nota)
            .reduce((soma, nota) => soma + nota) /
        _alunos.length;
  }

  @override
  double calculaTotalNotas() {
    return _alunos
        .map((aluno) => aluno.nota)
        .reduce((soma, nota) => soma + nota)
        .floorToDouble();
  }

  @override
  void matriculaAluno(Aluno novoAluno) {
    var alunoJaCadastrado = _alunos.any((aluno) {
      var eIgual = aluno.pessoa.id == novoAluno.pessoa.id;

      return eIgual;
    });

    if (alunoJaCadastrado) {
      throw 'Aluno já cadastrado';
    }

    _alunos.add(novoAluno);
  }

  @override
  Future<bool> recuperaTurmaJson() async {
    var file = File('turma.json');

    try {
      if (!(await file.exists())) return false;

      var conteudo = await file.readAsString();
      var turmaMap = jsonDecode(conteudo) as Map;

      _alunos = (turmaMap['alunos'] as List).map((aluno) {
        var _aluno = Aluno.arquivo(
          Pessoa(
            aluno['id'],
            aluno['nome'],
            aluno['idade'],
          ),
          aluno['nota'],
          aluno['status'],
        );

        return _aluno;
      }).toList();

      return true;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> salvaTurmaJson() async {
    var file = File('turma.json');

    var alunosMap = _alunos.map((aluno) {
      return {
        'id': aluno.pessoa.id,
        'nome': aluno.pessoa.nome,
        'idade': aluno.pessoa.idade,
        'nota': aluno.nota,
        'status': aluno.status
      };
    }).toList();

    var turma = {
      'id': id,
      'alunos': alunosMap,
    };

    try {
      await file.writeAsString(jsonEncode(turma));
    } catch (e) {
      throw e;
    }
  }
}
