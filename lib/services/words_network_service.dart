import 'dart:convert';
import 'package:http/http.dart';
import 'package:project/models/words.dart';



class NetworkService {
  static const String baseUrl = "656ddd8dbcc5618d3c241f44.mockapi.io";
  static const String apiWord = "/words";

  static Future<List<Words>> getWordsFromApi() async {
    Uri url = Uri.https(baseUrl, apiWord);
    Response response = await get(url);

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to load words');
    } else {
      List<dynamic> data = jsonDecode(response.body);
      List<Words> wordsList = data.map((item) => Words.fromJson(item)).toList();
      return wordsList;
    }
  }

  static Future<String> postData(Words word) async {
    Uri url = Uri.https(baseUrl, apiWord);
    Response response = await post(
      url,
      body: jsonEncode(word.toJson()),
      headers: {'Content-type': 'application/json'},
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      print('Crash in uploading ${response.statusCode}');
    }
    print("Added successfully");
    return response.body;
  }

  static Future<String> updateWordInApi(String id, Words updatedWord) async {
    Uri url = Uri.https(baseUrl, '$apiWord/$id');
    Response response = await put(
      url,
      body: jsonEncode(updatedWord.toJson()),
      headers: {'Content-type': 'application/json'},
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      print('Failed to update word ${response.statusCode}');
    }
    print("Updated successfully");
    return response.body;
  }

  static Future<String> deleteWordInApi(String id) async {
    Uri url = Uri.https(baseUrl, '$apiWord/$id');
    Response response = await delete(url);
    if (response.statusCode != 200 && response.statusCode != 204) {
      print('Failed to delete word ${response.statusCode}');
    }
    print("Deleted successfully");
    return response.body;
  }
}
