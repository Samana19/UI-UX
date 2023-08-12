import 'package:flutter/material.dart';
import 'package:the_daily_digest/config/constants/ProximitySensor.dart';
import 'package:the_daily_digest/features/auth/presentation/view/login_page.dart';
import 'package:the_daily_digest/features/auth/presentation/view/signup_page.dart';
import 'package:the_daily_digest/features/category/presentation/view/about/about_page.dart';
import 'package:the_daily_digest/features/category/presentation/view/contact/contact_page.dart';
import 'package:the_daily_digest/features/category/presentation/view/health/health_news.dart';
import 'package:the_daily_digest/features/category/presentation/view/home/home_news.dart';
import 'package:the_daily_digest/features/category/presentation/view/politics/politics_news.dart';
import 'package:the_daily_digest/features/category/presentation/view/sports/sports_news.dart';
import 'package:the_daily_digest/features/category/presentation/view/technology/technology_news.dart';
import 'package:the_daily_digest/features/dashboard/presentation/view/news_details.dart';
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
    return ProximityBrightnessControl(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/login': (context) => const LoginPage(),
            '/signup': (context) => const SignUpPage(),
            '/home': (context) => const DashboardPage(),
            '/bottomnav': (context) => const BottomNavBar(),
            //=====================SIDEBAR=====================
            '/healthscreen': (context) => const HealthScreen(),
            '/homescreen': (context) => const HomeScreen(),
            '/politicsscreen': (context) => const PoliticsScreen(),
            '/sportsscreen': (context) => const SportsScreen(),
            '/technologyscreen': (context) => const TechnologyScreen(),
            '/aboutus': (context) => AboutPage(),
            '/contactus': (context) => ContactUsPage(),

            //=====================nEWS=====================
            '/newsdetails': (context) => const NewsDetails(),
          }),
    );
  }
}
