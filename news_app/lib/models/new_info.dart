class NewsInfo {
  String title = "";
  String discription = "";
  List<String?> images = [];
  String? uri = "";
  String source = "Monsieur Kuma";
  NewsInfo({required this.title, required this.discription, this.uri, required this.images});
}