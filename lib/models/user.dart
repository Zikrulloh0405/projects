import 'dart:convert';

List<User> fromJsonToObjectUSers(String data) =>
    List<User>.from(jsonDecode(data).map((e) => User.fromJson(e)));

String fromObjectListToJnUsers(List<User> words) =>
    jsonEncode(List.from(words.map((e) => e.toJson())));

class User {
  late String id;
  late String userName;
  late String password;

  User({
    required this.id,
    required this.userName,
    required this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'password': password,
    };
  }
}
