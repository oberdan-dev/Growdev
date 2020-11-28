// Dado um número qualquer, é preciso escrever no terminal o inverso do mesmo.
// Exemplo:
// 150 = 051

import 'dart:io';

void main(List<String> arguments) {
  int numero;
  bool firstTry = true;

  do {
    print(firstTry ? 'Digite um numero' : 'Valor inválido. Digite novamente');
    numero = int.tryParse(stdin.readLineSync());
    firstTry = false;
  } while (numero == null);

  var numFinal = numero;
  var numeroInvertido = 0;
  var primeiroDigito;

  firstTry = true;
  while (numero > 0) {
    if (firstTry) {
      primeiroDigito = numero % 10;
      numeroInvertido = (numeroInvertido * 10) + primeiroDigito;
      numero = numero ~/ 10;
      firstTry = false;
    }
    int digito = numero % 10;
    numeroInvertido = (numeroInvertido * 10) + digito;
    numero = numero ~/ 10;
  }

  if (primeiroDigito == 0)
    print('$numFinal = 0$numeroInvertido');
  else
    print('$numFinal = $numeroInvertido');
}
