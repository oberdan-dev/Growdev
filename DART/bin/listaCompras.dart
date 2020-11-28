// Bora pro mercadinho !!!
// Receba do usuário 5 itens de uma lista de compras. Cada item é composto pelo Nome e pela quantidade.
// Crie um Map com a informação de cada item e adicione em uma lista.
// Por fim percorra a lista imprimindo os itens cadastrados.

import 'dart:io';

void main(List<String> arguments) {
  var produtos = <Map<String, dynamic>>[
    {'Nome': null, 'Quantidade': null},
    {'Nome': null, 'Quantidade': null},
    {'Nome': null, 'Quantidade': null},
    {'Nome': null, 'Quantidade': null},
    {'Nome': null, 'Quantidade': null}
  ];
  for (var i = 0; i < produtos.length; i++) {
    bool firstTry = true;

    do {
      print(firstTry
          ? 'Digite um produto'
          : 'Entrada inválida. Digite novamente');
      produtos[i]['Nome'] = stdin.readLineSync();
      print(firstTry
          ? 'Digite a quantidade'
          : 'Entrada inválida. Digite novamente');
      produtos[i]['Quantidade'] = int.tryParse(stdin.readLineSync());
      firstTry = false;
    } while (produtos[i]['Nome'] == null ||
        produtos[i]['Quantidade'] == null ||
        produtos[i]['Quantidade'] < 1);
  }

  print(produtos);
}
