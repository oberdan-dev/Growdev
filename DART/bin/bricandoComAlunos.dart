// Vamos lá galera, a prática leva a perfeição hehhe
// Crie uma lista de Map de alunos (5 ou mais)
// que tenha as seguintes propriedades: Nome, idade, nota e status.
// Dado o seguinte gabarito de uma prova:
// gabarito: ['A', 'C', A', 'C, 'B', 'C', 'A', 'B', 'B', 'A']
// Percorra cada aluno, e faça cada aluno preencher
// uma lista de resposta de mesma quantidade que o gabarito.
// A resposta deve ser totalmente aleatória.
// Para cada resposta correta, o aluno ganha 1 ponto.
// Depois de lido as resposta de cada aluno e ter comparado com o gabarito,
// atualize o status dos alunos para APROVADO
// caso a nota seja maior ou igual a 4 ou REPROVADO caso seja menor que 4
// No final do programa mostre o seguinte resultado
// Média das nota dos aluno
// Aluno que tirou a maior nota
// Aluno que tirou a menor nota
// Uma lista com os alunos aprovados
// Uma lista com os alunos reprovados

import 'dart:math';

void main(List<String> arguments) {
  // alunos
  var alunos = <Map<String, dynamic>>[
    {'Nome': 'Aluno 1', 'Idade': '17', 'Nota': 0, 'Status': 'Não definido'},
    {'Nome': 'Aluno 2', 'Idade': '16', 'Nota': 0, 'Status': 'Não definido'},
    {'Nome': 'Aluno 3', 'Idade': '18', 'Nota': 0, 'Status': 'Não definido'},
    {'Nome': 'Aluno 4', 'Idade': '21', 'Nota': 0, 'Status': 'Não definido'},
    {'Nome': 'Aluno 5', 'Idade': '17', 'Nota': 0, 'Status': 'Não definido'}
  ];

  var gabarito = ['A', 'C', 'A', 'C', 'B', 'C', 'A', 'B', 'B', 'A'];

  var respostasPermitidas = [65, 66, 67];

  for (var aluno in alunos) {
    var nota = 0;
    for (var i = 0; i < gabarito.length; i++) {
      var resposta = respostasPermitidas[
          Random.secure().nextInt(respostasPermitidas.length)];
      if (gabarito[i] == String.fromCharCode(resposta)) {
        nota++;
      }
    }

    aluno['Nota'] = nota;
    aluno['Status'] = nota > 4 ? 'Aprovado' : 'Reprovado';
  }

  var media = alunos
          .map((aluno) => (aluno['Nota'] as int))
          .reduce((soma, nota) => soma + nota) /
      alunos.length;

  alunos.sort((aluno1, aluno2) =>
      (aluno1['Nota'] as int).compareTo((aluno2['Nota'] as int)));

  var piorAluno = alunos.first;
  var melhorAluno = alunos.last;

  var aprovados =
      alunos.where((aluno) => aluno['Status'].toString() == 'Aprovado');

  var reprovados =
      alunos.where((aluno) => aluno['Status'].toString() == 'Reprovado');

  print('Media: $media');
  print('Pior aluno: $piorAluno');
  print('Melhor aluno: $melhorAluno');
  print('Aprovados: ' + (aprovados.isEmpty ? 'Nenhum aprovado' : '$aprovados'));
  print('Reprovados: ' +
      (reprovados.length == 0 ? 'Nenhum reprovado' : '$reprovados'));
}
