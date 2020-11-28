import 'entidade.dart';

class Pessoa extends Entidade {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade, int id) : super(id);
  Pessoa.vazio(int id) : super(id);
}
