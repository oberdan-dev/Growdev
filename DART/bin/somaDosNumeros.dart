// Receber um número do usuário pelo terminal
// e fazer um programa que some os números pares
// e que não some os números múltiplos de 5.
// O programa só deve aceitar de entrada números pares,
// números com mais de 2 dígitos e números com menos de 5 dígitos

import 'dart:io';

void main(List<String> arguments) {
  var numero;
  bool firstTry = true;

  do {
    print(firstTry ? 'Digite um numero' : 'Valor inválido. Digite novamente');
    numero = int.tryParse(stdin.readLineSync());
    firstTry = false;
  } while (numero == null || numero % 2 != 0 || numero < 100 || numero > 99999);

  var dm = numero ~/ 10000;
  var m = (numero ~/ 1000) % 10;
  var c = (numero ~/ 100) % 10;
  var d = (numero % 100) ~/ 10;
  var u = (numero % 10) % 10;

  var total = numero;

  if (numero % 2 == 0 && numero % 5 != 0) {
    total = dm + m + c + d + u;
    print('Soma: $dm +  $m + $c + $d + $u = $total');
  } else {
    print('Numero multiplo de 5');
  }
}
