import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo {
  String? id = '';
  String? name = '';
  String? email = '';
  Timestamp birthday = Timestamp.now();
  String? avatar = '';
  List<int> bookmark = [];

  UserInfo({
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

  factory UserInfo.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as String;
    final name = data['name'] as String;
    final email = data['email'] as String;
    final birthday = data['birthday'] as Timestamp;
    final avatar = data['avatar'] as String;
    final bookmark = data['bookmark'] as List<dynamic>;
    final UserInfo user = UserInfo(id: id, name: name);
    user.avatar = avatar;
    user.birthday = birthday;
    user.bookmark = bookmark.cast<int>();
    user.email = email;
    return user;
  }
}
