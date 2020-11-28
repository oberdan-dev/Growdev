// Os primos fatoriais do número 13195 são 5, 7, 13 e 29.
// Logo, o maior primo fatorial é 29.
// Encontre o maior primo fatorial do número 600851475143.
// Um primo fatorial é aquele que divide corretamente
// o número alvo/restante até chegar ao 1
// Exemplo
// 13195  | 5
// 2639   | 7
// 377    | 13
// 29     | 29
// 1

import 'dart:math';

void main(List<String> arguments) {
  // var numero = 13195;
  var numero = 600851475143;

  var maiorFatorial = 0;

  for (var i = 1; i <= sqrt(numero); i++) {
    if (ePrimo(i) && numero % i == 0) maiorFatorial = i;
  }
  var numInt = maiorFatorial.round();
  print('O maior primo fatorial é $numInt');
}

bool ePrimo(var n) {
  for (var i = 2; i < sqrt(n); i++) if (n % i == 0) return false;
  return true;
}
