import 'dart:io';

import 'package:project/models/words.dart';
import 'package:project/services/menu_service.dart';
import 'package:project/services/navigator_service.dart';
import 'package:project/services/words_network_service.dart';

class ViewAllWords extends Menu {
  static const String id = "view_all_words";

  @override
  Future<void> build() async {
    await viewAllWords();
    print('\n1. Update a word');
    print('2. Delete a word');
    print('3. Return to main page');

    String input = stdin.readLineSync()!;
    switch (input) {
      case '1':
        await updateWord();
        break;
      case '2':
        await deleteWord();
        break;
      case '3':
        await Navigator.popUntil();
        break;
      default:
        print('Invalid Input');
        await build();
    }
  }

  Future<void> viewAllWords() async {
    print('Fetching words from the API...\n');

    try {
      List<Words> listOfWords = await NetworkService.getWordsFromApi();

      if (listOfWords.isNotEmpty) {
        print('List of Words:\n');
        for (var word in listOfWords) {
          print('Time: ${word.time}');
          print('Id: ${word.id}');
          print('Word: ${word.word}');
          print('Translation: ${word.translation}');
          print('Description: ${word.description} \n');
          // print('Number of Word: ${word.numOfWord}\n');
        }
      } else {
        print('No words available.');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> updateWord() async {
    stdout.write('Enter the ID of the word to update: ');
    String id = stdin.readLineSync()!;

    // Fetch the existing word data
    List<Words> listOfWords = await NetworkService.getWordsFromApi();
    Words? wordToUpdate = listOfWords.firstWhere(
      (word) => word.id == id,
    );

    if (wordToUpdate != null) {
      print('\nEnter the updated details for the word:');
      stdout.write('Word: ');
      wordToUpdate.word = stdin.readLineSync()!;

      stdout.write('Translation: ');
      wordToUpdate.translation = stdin.readLineSync()!;

      stdout.write('Description: ');
      wordToUpdate.description = stdin.readLineSync()!;

      try {
        await NetworkService.updateWordInApi(id, wordToUpdate);
        print('Word updated successfully!');
      } catch (e) {
        print('Error updating word: $e');
      }
    } else {
      print('Word with ID $id not found.');
    }

    await build(); 
  }

  Future<void> deleteWord() async {
    stdout.write('Enter the ID of the word to delete: ');
    String id = stdin.readLineSync()!;

    try {
      await NetworkService.deleteWordInApi(id);
      print('Word deleted successfully!');
    } catch (e) {
      print('Error deleting word: $e');
    }

    await build(); 
  }
}
