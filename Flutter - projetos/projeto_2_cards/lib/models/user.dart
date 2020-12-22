class User {
  int id;
  String name;
  String email;
  String password;
  String token;

  User(this.id, this.name, this.token, {this.password});

  User.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'],
        name = json['user']['name'],
        email = json['user']['email'],
        token = json['token'];

  @override
  String toString() {
    // TODO: implement toString
    return 'Usuário: $name, Email $email, Token $token';
  }
}
