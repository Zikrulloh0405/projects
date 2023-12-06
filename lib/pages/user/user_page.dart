import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:project/models/words.dart';
import 'package:project/services/menu_service.dart';
import 'package:project/services/words_network_service.dart';
import 'package:project/services/navigator_service.dart';

class UserPage extends Menu {
  static const String id = "user_page";

  late String user;

  UserPage({String? user});

  @override
  Future<void> build() async {
    print('User Page!\n');
    print('1. Review All Words');
    print('2. Word Guessing Game');
    print('3. Translation Matching Game');
    print('0. Exit\n');

    String input = stdin.readLineSync()!;
    await getPage(input);
  }

  Future<void> getPage(String input) async {
    switch (input) {
      case "1":
        await reviewAllWords();
        break;
      case "2":
        await wordGuessingGame();
        break;
      case "3":
        await translationMatchingGame();
        break;
      case "0":
        exit(0);
      default:
        print('Invalid Input');
        await build();
    }
  }

  Future<void> reviewAllWords() async {
    List<Words> listOfWords = await NetworkService.getWordsFromApi();

    if (listOfWords.isEmpty) {
      print('No words available. Please add words first.');
      return;
    }

    print('Review All Words:\n');
    for (var word in listOfWords) {
      print('Word: ${word.word}');
      print('Translation: ${word.translation}');
      print('Description: ${word.description}\n');
    }
    await build();
  }

  Future<void> wordGuessingGame() async {
    List<Words> listOfWords = await NetworkService.getWordsFromApi();

    if (listOfWords.isEmpty) {
      print('No words available. Please add words first.');
      return;
    }

    print('Word Guessing Game:\n');
    int correctAnswers = 0;

    for (var word in listOfWords) {
      print('Guess the word: ${word.translation}');
      String guess = stdin.readLineSync()!;

      if (guess.toLowerCase() == word.word.toLowerCase()) {
        print('Correct! You guessed the word.\n');
        correctAnswers++;
      } else {
        print('Incorrect! The correct word is: ${word.word}\n');
      }
    }

    print(
        '\nTotal Correct Answers: $correctAnswers out of ${listOfWords.length}\n');
    await build();
  }

  Future<void> translationMatchingGame() async {
    List<Words> listOfWords = await NetworkService.getWordsFromApi();

    if (listOfWords.isEmpty) {
      print('No words available. Please add words first.');
      return;
    }

    print('Translation Matching Game:\n');
    int correctAnswers = 0;

    for (var word in listOfWords) {
      List<String> options = [
        word.translation,
        getRandomTranslation(listOfWords, word.translation),
        getRandomTranslation(listOfWords, word.translation),
        getRandomTranslation(listOfWords, word.translation),
      ];

      options.shuffle();

      print('Match the word "${word.word}" with its translation:\n');
      for (int i = 0; i < options.length; i++) {
        print('${String.fromCharCode(i + 97)}) ${options[i]}');
      }

      String answer = stdin.readLineSync()!.toLowerCase();

      if (answer ==
          String.fromCharCode(options.indexOf(word.translation) + 97)) {
        print('Correct! You matched the translation.\n');
        correctAnswers++;
      } else {
        print('Incorrect! The correct translation is: ${word.translation}\n');
      }
    }

    print(
        '\nTotal Correct Matches: $correctAnswers out of ${listOfWords.length}\n');

    await build();
  }

  Future<void> anotherGame() async {
    // Implement your custom game logic here
    print('Another Game:\n');
    print('This is a placeholder for your custom game.\n');
  }

  String getRandomTranslation(
      List<Words> listOfWords, String currentTranslation) {
    var random = Random();
    String randomTranslation = currentTranslation;

    while (randomTranslation == currentTranslation) {
      randomTranslation =
          listOfWords[random.nextInt(listOfWords.length)].translation;
    }

    return randomTranslation;
  }
}
