class Cartao {
  int id;
  String content;
  String title;

  Cartao({this.id, this.content, this.title});

  Cartao.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['content'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'title': title,
      };

  @override
  String toString() {
    return 'id: $id ... title: $title ... content: $content';
  }
}
