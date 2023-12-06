import 'dart:io';

import 'package:project/pages/admin/ranking.dart';
import 'package:project/pages/admin/students/students_page.dart';
import 'package:project/pages/admin/words/words_page.dart';
import 'package:project/services/menu_service.dart';
import 'package:project/services/navigator_service.dart';

class AdminPage extends Menu {
  static const String id = "admin_page";

  @override
  Future<void> build() async {
    print('Welcome to Admin Page \n');
    print('1. Words \n');
    print('2. Students \n');
    print('3. Ranking \n');
    print('0. Exit \n');
    String input = stdin.readLineSync()!;
    await getPage(input);
  }

  Future getPage(String input) async {
    switch (input) {
      case "1":
        await Navigator.push(WordsPage());
        break;
      case "2":
        await Navigator.push(StudentsPage());
        break;
      case "3":
        await Navigator.push(Ranking());
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
