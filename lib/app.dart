import 'package:flutter/material.dart';
import 'package:the_daily_digest/config/constants/ProximitySensor.dart';
import 'package:the_daily_digest/features/auth/presentation/view/login_page.dart';
import 'package:the_daily_digest/features/auth/presentation/view/signup_page.dart';
import 'package:the_daily_digest/features/category/presentation/view/about/about_page.dart';
import 'package:the_daily_digest/features/category/presentation/view/congratulations.dart';
import 'package:the_daily_digest/features/category/presentation/view/contact/contact_page.dart';
import 'package:the_daily_digest/features/category/presentation/view/filter_page.dart';
import 'package:the_daily_digest/features/category/presentation/view/forgot_password.dart';
import 'package:the_daily_digest/features/category/presentation/view/health/health_news.dart';
import 'package:the_daily_digest/features/category/presentation/view/home/home_news.dart';
import 'package:the_daily_digest/features/category/presentation/view/latest_page.dart';
import 'package:the_daily_digest/features/category/presentation/view/new%20explore/explore_new.dart';
import 'package:the_daily_digest/features/category/presentation/view/new%20user/edit_profile.dart';
import 'package:the_daily_digest/features/category/presentation/view/new%20user/user_new.dart';
import 'package:the_daily_digest/features/category/presentation/view/newbookmark/bookmark_new.dart';
import 'package:the_daily_digest/features/category/presentation/view/news%20details/news_detail.dart';
import 'package:the_daily_digest/features/category/presentation/view/otp_page.dart';
import 'package:the_daily_digest/features/category/presentation/view/politics/politics_news.dart';
import 'package:the_daily_digest/features/category/presentation/view/reset%20password.dart';
import 'package:the_daily_digest/features/category/presentation/view/sports/sports_news.dart';
import 'package:the_daily_digest/features/category/presentation/view/technology/technology_news.dart';
import 'package:the_daily_digest/features/category/presentation/view/trending_page.dart';
// import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_view/bookmark/bookmark_page.dart';
// import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_view/profile/user_profile.dart';
import 'package:the_daily_digest/features/dashboard/presentation/view/news_details.dart';
import 'package:the_daily_digest/features/splash/presentation/view/splash_screen.dart';
// import 'features/dashboard/presentation/view/bottom_nav.dart';
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
          initialRoute: '/home',
          routes: {
            '/': (context) => const HomePage(),
            '/login': (context) => const LoginPage(),
            '/signup': (context) => const SignUpPage(),
            '/home': (context) => const DashboardPage(),
            '/forgotpassword': (context) => ForgotPasswordPage(),
            '/otp': (context) => OtpPage(),
            '/resetpassword': (context) => ResetPasswordPage(),
            '/congrats': (context) => CongratulationsPage(), //congrats page

            // '/bottomnav': (context) => const BottomNavBar(),
            //=====================SIDEBAR=====================
            '/healthscreen': (context) => const HealthScreen(),
            '/homescreen': (context) => const HomeScreen(),
            '/politicsscreen': (context) => const PoliticsScreen(),
            '/sportsscreen': (context) => const SportsScreen(),
            '/technologyscreen': (context) => const TechnologyScreen(),
            '/aboutus': (context) => AboutPage(),
            '/contactus': (context) => ContactUsPage(),

            //=======================BOTTOMNAV=======================
            '/bookmarknew': (context) => const BookmarkScreen(),
            '/explorernew': (context) => const ExploreScreen(),
            '/profilenew': (context) => UserScreen(),
            '/editprofile': (context) => EditProfileScreen(),

            //=====================nEWS=====================
            '/newsdetails': (context) => const NewsDetailScreen(),
            '/trending': (context) => const TrendingScreen(),
            '/latest': (context) => const LatestScreen(),
            '/filter': (context) => const FilterPage(),
          }),
    );
  }
}
