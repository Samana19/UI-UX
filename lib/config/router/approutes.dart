import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_nav.dart';
import 'package:the_daily_digest/features/auth/presentation/view/login_page.dart';
import 'package:the_daily_digest/features/auth/presentation/view/signup_page.dart';
import 'package:the_daily_digest/features/splash/presentation/view/splash_screen.dart';
import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_view/dashboard/dashboard_page.dart';

class AppRoute {
  AppRoute._();
  static String splashRoute = '/';
  static String loginRoute = '/login';
  static String signupRoute = '/signup';
  static String dashRoute = '/home';
  // static String bottomnavRoute = '/bottomnav';

  static getAppRoutes() {
    return {
      splashRoute: (context) => const HomePage(),
      loginRoute: (context) => const LoginPage(),
      signupRoute: (context) => const SignUpPage(),
      dashRoute: (context) => const DashboardPage(),
      // bottomnavRoute: (context) => const BottomNavBar(),
    };
  }
}
