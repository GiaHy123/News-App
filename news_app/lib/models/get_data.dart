import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

import '../models/new_info.dart';
import 'news_details.dart';

class GetDataForNews {
  static Future<dom.Document> getHTML(String uri) async {
    final url = Uri.parse(uri);
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    return html;
  }

  static Future<List<List<String?>>> getImagesForNews(List<String?> urls) async {
    List<List<String?>> tmp = [];
    for (final url in urls) {
      dom.Document html = await getHTML(url.toString());
      final images = html
          .querySelectorAll('div > picture > img')
          .map((element) => element.attributes['data-src'])
          .toList();
      tmp.add(images);
    }
    return tmp;
  }

  static Future<List<NewsInfo>> getWebsiteData(String linkNews) async {
    dom.Document html = await getHTML(linkNews);

    final titles = html
        .querySelectorAll('#automation_TV0 > article > h3 > a')
        .map((element) => element.innerHtml.trim())
        .toList();

    final discriptions = html
        .querySelectorAll('#automation_TV0 > article > p > a')
        .map((element) => element.innerHtml.trim())
        .toList();

    final uris = html
        .querySelectorAll('#automation_TV0 > article > p > a')
        .map((element) => element.attributes['href'])
        .toList();

    return List.generate(
        titles.length,
        (index) => NewsInfo(
              title: titles[index],
              discription: discriptions[index],
              uri: uris[index],
              images: [
                "https://pbs.twimg.com/media/FflXdAeVIAEFMF-?format=jpg&name=large"
              ],
            ));
  }

  // Get title, discription, content and image of some News with link
  static Future<NewsDetails> getNewsDetails(String link, NewsInfo newsInfo) async {
    dom.Document html = await getHTML(link);
    final listContent = html
        .querySelectorAll(
            'article')
        .map((element) => element.getElementsByClassName("Normal"))
        .toList();
    List<String> dataContent = [];
    if (listContent.isNotEmpty){
      for (final content in listContent[0]) {
        dataContent.add(content.innerHtml);
      }
    }
    return NewsDetails(
      title: newsInfo.title,
      discription: newsInfo.discription,
      content: dataContent,
      images: newsInfo.images,
    );
  }
}
