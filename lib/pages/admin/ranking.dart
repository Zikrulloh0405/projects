import 'package:project/services/menu_service.dart';

class Ranking extends Menu {
  static const String id = "ranking_page";

  @override
  Future<void> build() async {
    print('Welcome to ranking');
  }
}
