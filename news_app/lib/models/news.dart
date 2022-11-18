class News {
  String title = '';
  String discription = '';
  List<dynamic> images = [];
  String uri = '';
  String author = '';
  String category = '';
  List<dynamic> content = [];
  News({
    required this.title, 
    required this.discription, 
    required this.images, 
    required this.uri,
    required this.author,
    required this.category,
    required this.content
  });

  factory News.fromJson(Map<String, dynamic> data) {
    final title = data['title'] as String;
    final discription = data['discription'] as String;
    final images = data['images'] as List<dynamic>;
    final uri = data['uri'] as String;
    final author = data['author'] as String;
    final category = data['category'] as String;
    final content = data['content'] as List<dynamic>;
    return News(title: title, discription: discription, images: images, uri: uri, author: author, category: category, content: content);
  }
}