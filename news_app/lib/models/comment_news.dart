class CommentNews {
  String idUser = '';
  String content = '';
  String nameUser = '';
  String avatarUser = '';

  CommentNews({
    required this.content,
    required this.idUser,
    required this.nameUser,
    required this.avatarUser,
  });

  Map<String, dynamic> toJson() => {
    "idUser": idUser,
    'content': content,      
    'nameUser': nameUser,
    'avatarUser': avatarUser,
  };

  factory CommentNews.fromJson(Map<String, dynamic> data) {
    final content = data['content'] as String;
    final idUser = data['idUser'] as String;
    final nameUser = data['nameUser'] as String;
    final avatarUser = data['avatarUser'] as String;
    return CommentNews(content: content, idUser: idUser, nameUser: nameUser, avatarUser: avatarUser);
  }
}