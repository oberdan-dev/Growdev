// Refatorando o maiorNumFatorial

import 'dart:math';

void main(List<String> arguments) {
  // var numero = 13195;
  var lista = <int>[];
  var numero = 600851475143;

  var maiorFatorial = 0;

  for (var i = 2; i <= sqrt(numero); i++) {
    if (ePrimo(i) && numero % i == 0) {
      maiorFatorial = i;
      lista.add(maiorFatorial);
    }
  }
  var numInt = maiorFatorial.round();
  var provaReal = 1;
  for (var i = 0; i < lista.length; i++) {
    provaReal = provaReal * lista[i];
  }

  print('O maior primo fatorial de $numero é $numInt');
  print('Pela prova real: $numero = $provaReal');
}

bool ePrimo(var n) {
  for (var i = 2; i < sqrt(n); i++) if (n % i == 0) return false;
  return true;
}
