// Fazer um programa que recebe um número
// do usuário pelo terminal que seja maior que 200
// e imprimir todos os números múltiplos de 8

import 'dart:io';

void main(List<String> arguments) {
  var numero;
  bool firstTry = true;

  do {
    print(firstTry ? 'Digite um numero' : 'Valor inválido. Digite novamente');
    numero = int.tryParse(stdin.readLineSync());
    firstTry = false;
  } while (numero == null || numero < 200);

  for (var i = 0; i < numero; i++) {
    if (i % 8 == 0) print(i);
  }
}
