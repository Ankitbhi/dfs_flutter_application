import 'package:dfs_flutter_application/core/theme/app_theme.dart';
import 'package:dfs_flutter_application/routes/routes.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/provider/login_provider.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/provider/start_screen_provider.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/provider/advisory_page_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => StartScreenProvider()),
        ChangeNotifierProvider(create: (_) => AdvisoryPageProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Login Example',
        theme: appTheme,
        initialRoute: AppRoutes.initialRoute,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
