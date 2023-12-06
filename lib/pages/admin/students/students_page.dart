// StudentsPage

import 'dart:io';
import 'package:project/pages/admin/students/add_students_page.dart';
import 'package:project/pages/admin/students/view_students_page.dart';
import 'package:project/services/menu_service.dart';
import 'package:project/services/navigator_service.dart';

class StudentsPage extends Menu {
  static const String id = "students_page";

  @override
  Future<void> build() async {
    print('Students Menu\n');
    print('1. Add Students \n');
    print('2. View All Students \n');
    print('3. Return \n');
    print('0. Exit \n');
    String input = stdin.readLineSync()!;
    await handleInput(input);
  }

  Future handleInput(String input) async {
    switch (input) {
      case "1":
        await Navigator.push(AddStudentPage());
        break;
      case "2":
        await Navigator.push(ViewStudentsPage());
        break;
      case "3":
        await Navigator.pop();
        break;
      case "0":
        exit(0);
      default:
        print('Invalid Input');
        await build();
    }
  }
}
