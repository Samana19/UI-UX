import 'package:flutter/material.dart';
import 'package:the_daily_digest/features/auth/presentation/view/login_page.dart';
import 'package:the_daily_digest/features/auth/presentation/view/signup_page.dart';
import 'package:the_daily_digest/features/splash/presentation/view/splash_screen.dart';
import 'features/dashboard/presentation/view/bottom_nav.dart';
import 'features/dashboard/presentation/view/bottom_view/dashboard/dashboard_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const BottomNavBar(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/home': (context) => const DashboardPage(),
          '/bottomnav': (context) => const BottomNavBar(),
        });
  }
}
