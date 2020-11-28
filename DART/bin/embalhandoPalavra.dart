// Vamos lá devs
// Esta atividade vai fazer você usar sua criatividade,
// Dado uma palavra qualquer, deve ser escrito no terminal esta mesma palavra embaralhada.
// Para embaralhar use usa criatividade.
// Exemplo:
// growdev = worgved

import 'dart:io';

bool firstTry = true;

void main(List<String> arguments) {
  var str;

  do {
    print(
        firstTry ? 'Digite uma palavra' : 'Entrada inválida. Digite novamente');
    str = stdin.readLineSync();
    firstTry = false;
  } while (str == null);

  var shuffled = str.split('').toList()..shuffle();

  print(shuffled.join());
}
