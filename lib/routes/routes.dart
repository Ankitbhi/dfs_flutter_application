import 'package:dfs_flutter_application/auth_checker.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/login_page.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/select_language_screen.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/select_profile_screen.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/signin_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/home_page.dart';
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
      case '/appLanguage':
        return MaterialPageRoute(builder: (_) => const SelectLanguage());
      case '/selectProfile':
        return MaterialPageRoute(builder: (_) => const SelectProfileScreen());
      case '/signinPage':
        return MaterialPageRoute(builder: (_) => const SignInPage());
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
