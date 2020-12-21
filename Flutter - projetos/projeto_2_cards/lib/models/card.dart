class Card {
  int id;
  String content;
  String title;

  Card(this.id, this.content, this.title);

  Card.fromJson(Map<String, dynamic> json)
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
    // TODO: implement toString
    return 'id: ${id} ... title: ${title} ... content: ${content}';
  }
}
