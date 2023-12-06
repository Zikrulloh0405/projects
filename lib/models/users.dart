// import 'dart:io';
// import 'admin/admin_page.dart';
// import 'user/user_page.dart';

// class User {
//   String username;
//   String password;
//   bool isAdmin;
//   int dailyRank; // Added a daily rank property

//   User(this.username, this.password, this.isAdmin, this.dailyRank);
// }

// List<User> users = [
//   User("admin", "adminPassword", true, 0),
//   User("aaa", "123", false, 123),
//   User("Joseph", "user2Password", false, 90),
//   // ... add more users as needed
// ];

// User? login() {
//   print("Enter username:");
//   String username = stdin.readLineSync()!;
//   print("Enter password:");
//   String password = stdin.readLineSync()!;

//   for (User user in users) {
//     if (user.username == username && user.password == password) {
//       return user;
//     }
//   }

//   print("Invalid username or password. Please try again.");
//   return null;
// }

// void homeMenu() {
//   while (true) {
//     print("Home Menu:");
//     print("1. Log In");
//     print("2. Sign Up");
//     print("3. Exit");

//     String choice = stdin.readLineSync()!;

//     switch (choice) {
//       case '1':
//         User? loggedInUser = login();
//         if (loggedInUser != null) {
//           if (loggedInUser.isAdmin) {
//             adminMenu(loggedInUser);
//           } else {
//             userMenu(loggedInUser);
//           }
//         }
//         break;

//       case '2':
//         User? loggedInUser = login();
//         if (loggedInUser != null) {
//           if (loggedInUser.isAdmin) {
//             adminMenu(loggedInUser);
//           } else {
//             userMenu(loggedInUser);
//           }
//         }
//         break;

//       case '3':
//         print("Exiting program.");
//         return;

//       default:
//         print("Invalid choice. Please try again.");
//         break;
//     }
//   }
// }
