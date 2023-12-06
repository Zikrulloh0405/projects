import 'navigator_service.dart';

import 'package:project/services/menu_service.dart';

class MyApp {
  static Map<String, Menu> routeMenus = {};

  MyApp({required Menu home, required Map<String, Menu> routes}) {
    routeMenus = routes;
    Navigator.initialValue = home;
    _runApp(home);
  }

  void _runApp(Menu menu) async {
    while (true) {
      await menu.build();
    }
  }
}
