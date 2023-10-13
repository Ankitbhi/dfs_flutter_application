import 'package:dfs_flutter_application/auth_checker.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/login_page.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/select_language_screen.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/select_profile_screen.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/pages/signin_page.dart';
import 'package:dfs_flutter_application/src/features/detailsPages/pages/land_details_form.dart';
import 'package:dfs_flutter_application/src/features/detailsPages/pages/livestock_detail_form.dart';
// import 'package:dfs_flutter_application/src/features/advisory/presentation/pages/profile_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/adviosry_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/ask_me_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/crop_details_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/fisheries_details_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/home_page.dart';
import 'package:dfs_flutter_application/src/pages/home_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/liverstock_details_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/schemes_details_page.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/pages/schemes_page.dart';
import 'package:flutter/material.dart';
import 'package:dfs_flutter_application/src/features/registration/pages/profile_page.dart';

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
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case '/schemes':
        return MaterialPageRoute(builder: (_) => const SchemesPage());
      case '/schemesDetails':
        return MaterialPageRoute(builder: (_) => const SchemesDetailsPage());
      case '/askme':
        return MaterialPageRoute(builder: (_) => const AksMePage());
      case '/advisory':
        return MaterialPageRoute(builder: (_) => const AdvisoryPage());
      case '/cropDetails':
        return MaterialPageRoute(builder: (_) => const CropDetailsPage());
      case '/livestockDetails':
        return MaterialPageRoute(builder: (_) => const LivertockDetailsPage());
      case '/fisheriesDetails':
        return MaterialPageRoute(builder: (_) => const FisheriesDetailsPage());
      case '/registration':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case '/landDetailsForm':
        return MaterialPageRoute(builder: (_) => const LandDetailForm());
      case '/liveStockDetailForm':
        return MaterialPageRoute(builder: (_) => const LivestockDetailForm());
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
