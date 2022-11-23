class CommentNews {
  String idUser = '';
  String content = '';
  String nameUser = ''
;
  CommentNews({
    required this.content,
    required this.idUser,
    required this.nameUser,
  });

  Map<String, dynamic> toJson() => {
    "idUser": idUser,
    'content': content,      
    'nameUser': nameUser,
  };

  factory CommentNews.fromJson(Map<String, dynamic> data) {
    final content = data['content'] as String;
    final idUser = data['idUser'] as String;
    final nameUser = data['nameUser'] as String;
    return CommentNews(content: content, idUser: idUser, nameUser: nameUser);
  }
}