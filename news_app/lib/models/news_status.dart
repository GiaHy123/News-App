import 'package:news_app/models/comment.dart';

class NewsStatus {
  List<Comment> comment = [];
  List<String> like = [];

  NewsStatus({
    required this.comment,
    required this.like,
  });

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "like": like,
  };

  factory NewsStatus.fromJson(Map<String, dynamic> data) {
    final comment = data['comment'] as List<dynamic>;
    final like = data['like'] as List<dynamic>;
    return NewsStatus(comment: comment.cast<Comment>(), like: like.cast<String>());
  }
}