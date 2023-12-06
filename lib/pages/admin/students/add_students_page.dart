import 'dart:io';

import 'package:project/models/user.dart';
import 'package:project/models/words.dart';
import 'package:project/pages/admin/students/view_students_page.dart';
import 'package:project/services/menu_service.dart';
import 'package:project/services/navigator_service.dart';
import 'package:project/services/user_network_service.dart';

class AddStudentPage extends Menu {
  static const String id = "add_student_page";

  late List<User> userList = <User>[];

  @override
  Future<void> build() async {
    await getUsersFromAdmin();

    print('1. View all students');
    print('2. Return to main page');
    String input = stdin.readLineSync()!;
    if (input == '1' || input == "2") {
      switch (input) {
        case "1":
          await Navigator.push(ViewStudentsPage());
          break;
        case "2":
          await Navigator.pop();
          break;
      }
    } else {
      print('Invalid Input');
      await Navigator.popUntil();
    }
  }

  Future<void> getUsersFromAdmin() async {
    stdout.write('Enter the number of students you want to add :   ');

    try {
      int numberOfStudents = int.parse(stdin.readLineSync()!);

      for (var i = 0; i < numberOfStudents; i++) {
        print('\nEnter the details of student ${i + 1} : ');
        String userId = (i + 1).toString();
        stdout.write('Username :');
        String userName = stdin.readLineSync()!;

        stdout.write('Password :');
        String password = stdin.readLineSync()!;

        userList.add(User(id: userId, userName: userName, password: password));
      }
      String data =
          await UserNetworkService.postData(fromObjectListToJnUsers(userList));
    } catch (e) {
      print('Invalid input');
    }
  }
}
