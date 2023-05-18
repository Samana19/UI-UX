import 'package:flutter/material.dart';
import 'package:the_daily_digest/views/login_page.dart';
import 'package:the_daily_digest/views/signup_page.dart';
import 'package:the_daily_digest/views/splash_screen.dart';
import 'views/dashboard_page.dart';


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
          '/': (context) => const HomePage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/home': (context) => const DashboardPage(),
          
        });
  }
}
