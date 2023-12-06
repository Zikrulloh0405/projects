import 'dart:io';
import 'package:project/services/menu_service.dart';
import 'package:project/services/navigator_service.dart';
import 'package:project/services/user_network_service.dart';
import 'package:project/pages/admin/admin_page.dart';
import 'package:project/pages/user/user_page.dart';

class LoginPage extends Menu {
  static const String id = "login_page";

  @override
  Future<void> build() async {
    print('Login Page\n');
    print('1. Login as Admin');
    print('2. Login as User');
    print('0. Exit\n');

    String input = stdin.readLineSync()!;

    switch (input) {
      case '1':
        await loginAdmin();
        break;

      case '2':
        await loginUser();
        break;

      case '0':
        exit(0);

      default:
        print('Invalid Input');
        await build();
        break;
    }
  }

  Future<void> loginAdmin() async {
    stdout.write('Enter admin username: ');
    String adminUsername = stdin.readLineSync()!;
    stdout.write('Enter admin password: ');
    String adminPassword = stdin.readLineSync()!;

    if (adminUsername == 'admin' && adminPassword == '12345') {
      print('Admin Login Successful!\n');
      await Navigator.push(AdminPage());
    } else {
      print('Invalid admin credentials. Please try again.\n');
      await build();
    }
  }

  Future<void> loginUser() async {
    stdout.write('Enter username: ');
    String username = stdin.readLineSync()!;
    stdout.write('Enter password: ');
    String password = stdin.readLineSync()!;

    bool isValidUser = await UserNetworkService.isUserValid(username, password);

    if (isValidUser) {
      print('User Login Successful!\n');
      await Navigator.push(UserPage(user: username));
    } else {
      print('Invalid user credentials. Please try again.\n');
      await build();
    }
  }
}
