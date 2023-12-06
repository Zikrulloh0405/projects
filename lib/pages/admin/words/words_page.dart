// WordsPage

import 'dart:io';
import 'package:project/pages/admin/words/add_words.dart';
import 'package:project/pages/admin/words/view_all_words.dart';
import 'package:project/services/menu_service.dart';
import 'package:project/services/navigator_service.dart';

class WordsPage extends Menu {
  static const String id = "words_page";

  @override
  Future<void> build() async {
    print('Words Menu\n');
    print('1. Add Words \n');
    print('2. View All Words \n');
    print('3. Return \n');
    print('0. Exit \n');
    String input = stdin.readLineSync()!;
    await handleInput(input);
  }

  Future handleInput(String input) async {
    switch (input) {
      case "1":
        await Navigator.push(AddWordPage());
        break;
      case "2":
        await Navigator.push(ViewAllWords());
        break;
      case "3":
        await Navigator.pop();
        break;
      case "0":
        exit(0);
        break;
      default:
        print('Invalid Input');
        await build();
    }
  }
}
