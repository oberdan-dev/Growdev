// Fazer uma função com o nome ePrimo que recebe um número
// e retorne um booleano informando se o número é primo ou não
// (Você pode utilizar essa função para outras atividades com relação aos números primos)

import 'dart:io';

void main(List<String> arguments) {
  var numero;
  var numInt;

  bool firstTry = true;

  do {
    print(firstTry ? 'Digite um numero' : 'Valor inválido. Digite novamente');
    numero = double.tryParse(stdin.readLineSync());
    firstTry = false;
  } while (numero == null);

  numInt = numero.round();
  if (numero == 0 || numero == 1)
    print('$numInt não é primo');
  else {
    var result = ePrimo(numero);
    result ? print('$numInt é primo') : print('$numInt não é primo');
  }
}

bool ePrimo(double n) {
  var resultado = 0;
  for (var i = 2; i <= (n / 2); i++) {
    if (n % i == 0) {
      resultado++;
    }
  }
  if (resultado == 0)
    return true;
  else
    return false;
}
