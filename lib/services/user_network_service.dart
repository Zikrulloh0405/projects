import 'dart:convert';

import 'package:http/http.dart';
import 'package:project/models/user.dart';

class UserNetworkService {
  static const String baseUrl = "656ddd8dbcc5618d3c241f44.mockapi.io";
  static const String apiUsers = "/users";

  static const String adminUserName = "admin";
  static const String adminPassword = "admin123";

  static Future<String> postData(String body) async {
    Uri url = Uri.https(baseUrl, apiUsers);
    Response response = await post(url,
        body: body, headers: {'Content-type': 'application/json'});
    if (response.statusCode != 200 && response.statusCode != 201) {
      print('Failed to add user ${response.statusCode}');
    }
    print("User added successfully");
    return response.body;
  }

  static Future<String> getUsersFromApi() async {
    Uri url = Uri.https(baseUrl, apiUsers);
    Response response = await get(url);

    // if (response.statusCode != 200 && response.statusCode != 201) {
    //   throw Exception('Failed to load users');
    // } else {
    return response.body;
    // }
  }

  static Future<String> updateData(String id, String body) async {
    Uri url = Uri.https(baseUrl, '$apiUsers/$id');
    Response response = await put(url,
        body: body, headers: {'Content-type': 'application/json'});
    if (response.statusCode != 200 && response.statusCode != 204) {
      print('Failed to update user ${response.statusCode}');
    }
    print("User updated successfully");
    return response.body;
  }

  static Future<String> deleteData(String id) async {
    Uri url = Uri.https(baseUrl, '$apiUsers/$id');
    Response response = await delete(url);
    if (response.statusCode != 200 && response.statusCode != 204) {
      print('Failed to delete user ${response.statusCode}');
    }
    print("User deleted successfully");
    return response.body;
  }

  static Future<bool> isUserValid(String username, String password) async {
    String usersString = await getUsersFromApi();
    List<dynamic> jsonData = jsonDecode(usersString);
    List<User> users = jsonData.map((user) => User.fromJson(user)).toList();

    return users
        .any((user) => user.userName == username && user.password == password);
  }

  static bool isAdmin(String username, String password) {
    return username == adminUserName && password == adminPassword;
  }
}
