// Fazer um programa que percorra um range de números e adicione em uma lista.
// Crie uma segunda lista onde as posições pares são o dobro da lista original e as posições ímpares são o triplo

void main(List<String> arguments) {
  var lista = List<int>.generate(10, (i) => i + 1);
  var listaResultado = <int>[];
  for (var i = 0; i < lista.length; i++) {
    if (i % 2 == 0) {
      listaResultado.add(2 * lista[i]);
    } else
      listaResultado.add(3 * lista[i]);
  }
  print(lista);
  print(listaResultado);
}
