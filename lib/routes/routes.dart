import 'package:dfs_flutter_application/auth_checker.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/login_page.dart';
import 'package:dfs_flutter_application/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AuthChecker());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
