import 'package:project/main_log_in.dart';
import 'package:project/pages/admin/words/add_words.dart';
import 'package:project/pages/admin/admin_page.dart';
import 'package:project/pages/admin/ranking.dart';
import 'package:project/pages/admin/words/view_all_words.dart';
import 'package:project/pages/user/user_page.dart';
import 'package:project/services/my_app.dart';

void main(List<String> args) {
  MyApp(home: LoginPage(), routes: {
    AdminPage.id: AdminPage(),
    AddWordPage.id: AddWordPage(),
    ViewAllWords.id: ViewAllWords(),
    Ranking.id: Ranking()
  });
}
