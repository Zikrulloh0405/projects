import 'dart:convert';

List<Words> fromJsonToObjectWords(String data) =>
    List<Words>.from(jsonDecode(data).map((e) => Words.fromJson(e)));

String fromObjectListToJnWords(List<Words> words) =>
    jsonEncode(List.from(words.map((e) => e.toJson())));

class Words {
  late String id;
  late int time;
  late String numOfWord;
  late String word;
  late String translation;
  late String description;

  Words({
    required this.numOfWord,
    required this.word,
    required this.translation,
    required this.description,
  });

  Words.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    numOfWord = json['numOfWord'];
    word = json['word'];
    translation = json['translation'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'numOfWord': numOfWord,
      'word': word,
      'translation': translation,
      'description': description,
    };
  }
}
