// Seguinte a lista com os 6 primeiros números primos: 2, 3, 5, 7, 11 e 13,
// nos podemos ver que o número primo 13 é o 6º
// Desenvolva uma aplicação que encontre o número primo de posição 10001

import 'dart:io';

void main(List<String> arguments) {
  var i = 0;
  var numero = 1.0;

  while (i != 10001) {
    numero++;
    if (ePrimo(numero)) i++;
  }
  var numInt = numero.round();
  print('O 10001º número primo é: $numInt');
}

bool ePrimo(double n) {
  if (n < 2) {
    //0 e 1 não são primos
    return false;
  } else if (n == 2 || n == 3 || n == 5 || n == 7 || n == 11 || n == 13) {
    //primos conhecidos pelo enunciado
    return true;
  } else if (n % 2 == 0 ||
      n % 3 == 0 ||
      n % 5 == 0 ||
      n % 7 == 0 ||
      n % 11 == 0 ||
      n % 13 == 0) {
    //multiplos de primos não são primos
    return false;
  } else {
    for (var i = 13; i < (n + 1) / 2; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }
}
