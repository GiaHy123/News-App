import 'new_info.dart';

class NewsDetails extends NewsInfo {
  //String title = "";
  //String discription = "";
  String ?category = "";
  List<String> content = [];
  NewsDetails({ title , discription, images, this.category, required this.content}) : super(title: title, discription: discription, images: images);
}
