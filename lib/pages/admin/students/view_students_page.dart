import 'dart:io';

import 'package:project/models/user.dart';
import 'package:project/services/menu_service.dart';
import 'package:project/services/navigator_service.dart';
import 'package:project/services/user_network_service.dart';

class ViewStudentsPage extends Menu {
  static const String id = "view_students_page";

  @override
  Future<void> build() async {
    await viewAllStudents();
    print('\n1. Update a student');
    print('2. Delete a student');
    print('3. Return to main page');

    String input = stdin.readLineSync()!;
    switch (input) {
      case '1':
        await updateStudent();
        break;
      case '2':
        await deleteStudent();
        break;
      case '3':
        await Navigator.popUntil();
        break;
      default:
        print('Invalid Input');
        await build();
    }
  }

  Future<void> viewAllStudents() async {
    print('Fetching students from the API...\n');

    // try {
      String userListData = await UserNetworkService.getUsersFromApi();
      List<User> userList = fromJsonToObjectUSers(userListData);
      if (userList.isNotEmpty) {
        print('List of Students:\n');
        for (var student in userList) {
          print('ID : ${student.id}');
          print('Username: ${student.userName}');
          print('Password: ${student.password}\n');
        }
      } else {
        print('No students available.');
      }
    // } catch (e) {
    //   print('Error fetching student data: $e');
    // }
  }

  Future<void> updateStudent() async {
    stdout.write('Enter the ID of the student to update: ');
    String id = stdin.readLineSync()!;

    String userListData = await UserNetworkService.getUsersFromApi();
    List<User> userList = fromJsonToObjectUSers(userListData);
    User? studentToUpdate = userList.firstWhere(
      (student) => student.id == id,
    );

    if (studentToUpdate != null) {
      print('\nEnter the updated details for the student:');
      stdout.write('Username: ');
      studentToUpdate.userName = stdin.readLineSync()!;

      stdout.write('Password: ');
      studentToUpdate.password = stdin.readLineSync()!;

      try {
        await UserNetworkService.updateData(
            id, fromObjectListToJnUsers([studentToUpdate]));
        print('Student updated successfully!');
      } catch (e) {
        print('Error updating student: $e');
      }
    } else {
      print('Student with ID $id not found.');
    }

    await build(); 
  }

  Future<void> deleteStudent() async {
    stdout.write('Enter the ID of the student to delete: ');
    String id = stdin.readLineSync()!;

    try {
      await UserNetworkService.deleteData(id);
      print('Student deleted successfully!');
    } catch (e) {
      print('Error deleting student: $e');
    }

    await build(); 
  }
}
