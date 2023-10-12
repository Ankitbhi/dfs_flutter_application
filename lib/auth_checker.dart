import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/login_page.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/select_language_screen.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/signin_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/adviosry_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  Future<void> fakeDelay() async {
    await Future.delayed(
        const Duration(seconds: 0)); // Simulate a 2-second delay
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);

    return FutureBuilder<void>(
      future: fakeDelay(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator or animation here
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // Once the delay is complete, check the authentication status
          // if (userProvider.user?.isLoggedIn == true) {
          //   return HomePage();
          // } else {
          return const HomePage();
        }
        // }
      },
    );
  }
}
