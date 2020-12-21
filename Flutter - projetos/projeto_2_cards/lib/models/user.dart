class User {
  int id;
  String name;
  String password;
  String token;

  User(this.id, this.name, this.password, this.token);

  User.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'],
        name = json['user']['name'],
        password = json['user']['password'],
        token = json['token'];

  @override
  String toString() {
    // TODO: implement toString
    return 'Usuário: $name, Token $token';
  }
}
