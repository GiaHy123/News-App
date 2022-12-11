import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/constants/app_assets.dart';

class UserInfoDB {
  String? id = '';
  String? name = '';
  String? email = '';
  DateTime birthday = DateTime.now();
  String? avatar = AppAssets.avatar;
  List<int> bookmark = [];

  UserInfoDB({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "birthday": birthday,
        "avatar": avatar,
        "bookmark": bookmark,
  };

  factory UserInfoDB.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as String;
    final name = data['name'] as String;
    final email = data['email'] as String;
    final birthday = data['birthday'] as Timestamp;
    final avatar = data['avatar'] as String;
    final bookmark = data['bookmark'] as List<dynamic>;
    final UserInfoDB user = UserInfoDB(id: id, name: name);
    user.avatar = avatar;
    user.birthday = birthday.toDate();
    user.bookmark = bookmark.cast<int>();
    user.email = email;
    return user;
  }
}
