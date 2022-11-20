class UserInfo {
  String? id = '';
  String? name = '';
  String? email = '';
  DateTime birthday = DateTime.now();
  String avatar = '';

  UserInfo({
    required this.id,
    required this.name,
  });
}