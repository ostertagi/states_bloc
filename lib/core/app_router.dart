import 'package:flutter/material.dart';
import 'package:states_bloc/pages/about_page.dart';
import 'package:states_bloc/pages/home_page.dart';
import 'package:states_bloc/pages/settings_page.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    late Widget _page;

    switch (settings.name) {
      case HomePage.routeName:
        _page = HomePage();
        break;

      case AboutPage.routeName:
        _page = AboutPage();
        break;

      case SettingsPage.routeName:
        _page = SettingsPage();
        break;
    }
    return MaterialPageRoute(builder: (context) => _page);
  }
}

/*
class AppRouter {
  
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    late Widget _page;

    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case AboutPage.routeName:
        return MaterialPageRoute(
          builder: (_) => AboutPage(),
        );

      case SettingsPage.routeName:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
    }
  }
}
*/